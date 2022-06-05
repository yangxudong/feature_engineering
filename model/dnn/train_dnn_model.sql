-- 使用阿里云机器学习PAI平台的EasyRec算法框架训练DNN模型
-- EasyRec 推荐算法框架已开源：https://github.com/alibaba/EasyRec

pai -name easy_rec_ext
  -Dcmd='train'
  -Dconfig='oss://cold-start/EasyRec/deploy/multi_tower/gauss_rank_v2.config'
  -Dtrain_tables='odps://pai_rec_dev/tables/ecommerce_train_instances_v2'
  -Deval_tables='odps://pai_rec_dev/tables/ecommerce_validate_instances_v2'
  -Dmodel_dir='oss://cold-start/EasyRec/deploy/multi_tower/gauss_rank_v2'
  -Dbuckets='oss://cold-start/'
  -Darn='acs:ram::XXXXXXXXXX:role/aliyunodpspaidefaultrole'
  -DossHost='oss-cn-beijing-internal.aliyuncs.com'
  -Dcluster='{
      \"ps\": {
          \"count\" : 1,
          \"cpu\" : 800
      },
      \"worker\" : {
          \"count\" : 9,
          \"cpu\" : 800
      }
  }';

-- pai -name easy_rec_ext
--   -Dcmd='export'
--   -Dversion='20220415'
--   -Dres_project=pai_rec_dev
--   -Dconfig='oss://cold-start/EasyRec/deploy/multi_tower/gauss_rank_lite2/pipeline.config'
--   -Dexport_dir='oss://cold-start/EasyRec/deploy/multi_tower/gauss_rank_lite2/export/final'
--   -Dbuckets='oss://cold-start/'
--   -Darn='acs:ram::XXXXXXXXXXXXX:role/aliyunodpspaidefaultrole'
--   -DossHost='oss-cn-beijing-internal.aliyuncs.com'
-- ;

pai -name easy_rec_ext
  -Dcmd='predict'
  -Dsaved_model_dir='oss://cold-start/EasyRec/deploy/multi_tower/gauss_rank_v2/export/final'
  -Dinput_table='odps://pai_rec_dev/tables/ecommerce_test_instances_v2'
  -Doutput_table='odps://pai_rec_dev/tables/ecommerce_gauss_rank_model_predict'
  -Dreserved_cols='user_id,product_id,is_purchased'
  -Doutput_cols='probs double'
  -Dmodel_outputs='probs'
  -Dbatch_size=1024
  -Dbuckets='oss://cold-start/'
  -Darn='acs:ram::XXXXXXXXXXXXXX:role/aliyunodpspaidefaultrole'
  -DossHost='oss-cn-beijing-internal.aliyuncs.com'
  -Dcluster='{
      \"worker\" : {
          \"count\" : 8,
          \"cpu\" : 600
      }
  }';

--precison, recall
SELECT *, TP / (TP + FN) recall,  TP / (TP + FP) precision
FROM (
    SELECT
        COUNT_IF(is_purchased=1 AND probs >= 0.5) TP,
        COUNT_IF(is_purchased=1 AND probs < 0.5) FN,
        COUNT_IF(is_purchased=0 AND probs >= 0.5) FP,
        COUNT_IF(is_purchased=0 AND probs < 0.5) TN
    FROM ecommerce_gauss_rank_model_predict
) T
;

-- global AUC
SELECT (ry - 0.5*n1*(n1+1))/n0/n1 as auc
FROM (
    SELECT
        SUM(IF(is_purchased=0, 1, 0)) n0,
        SUM(IF(is_purchased=1, 1, 0)) n1,
        SUM(IF(is_purchased=1, r, 0)) ry
    FROM (
        SELECT is_purchased, probs, ROW_NUMBER() OVER(ORDER BY probs ASC) as r
        FROM ecommerce_gauss_rank_model_predict
    )
);

-- GAUC group AUC
SELECT AVG((ry - 0.5*n1*(n1+1))/n0/n1) as gauc
FROM (
    SELECT user_id,
        COUNT_IF(is_purchased=0) n0,
        COUNT_IF(is_purchased=1) n1,
        SUM(IF(is_purchased=1, r, 0)) ry
    FROM (
        SELECT  user_id, is_purchased, probs, ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY probs ASC) as r
        FROM ecommerce_gauss_rank_model_predict
    )
    GROUP BY user_id
)
WHERE n0 > 0 AND n1 > 0;
