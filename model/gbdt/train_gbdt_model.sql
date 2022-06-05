-- 使用阿里云机器学习PAI平台的PS_SMART（GBDT）算法训练和预测
--训练
PAI -name ps_smart
    -project algo_public
    -DinputTableName="pai_rec_dev.ecommerce_gbdt_model_samples2"
    -DinputTablePartitions="dt=train"
    -DmodelName="ecommerce_gbdt_model_new"
    -DoutputTableName="ecommerce_gbdt_model_new"
    -DoutputImportanceTableName="ecommerce_gbdt_model_new_importance"
    -DlabelColName="label"
    -DfeatureColNames="features"
    -DenableSparse="true"
    -Dobjective="binary:logistic"
    -Dmetric="auc"
    -DfeatureImportanceType="gain"
    -DtreeCount="100"
    -DmaxDepth="5"
    -Dshrinkage="0.3"
    -Dl2="1.0"
    -Dl1="0"
    -DsketchEps="0.03"
    -DsampleRatio="1.0"
    -DfeatureRatio="1.0"
    -DbaseScore="0.5"
    -DminSplitLoss="0"
    -DmemSizePerCore="16384"
    -DcoreNum="16"
;

--预测
PAI -name prediction
    -project algo_public
    -DinputTableName="pai_rec_dev.ecommerce_gbdt_model_samples2"
    -DinputTablePartitions="dt=test"
    -DmodelName="ecommerce_gbdt_model_new"
    -DoutputTableName="ecommerce_gbdt_model_result_new"
    -DfeatureColNames="features"
    -DappendColNames="user_id,product_id,user_session,label"
    -DenableSparse="true"
;

--precison, recall
SELECT *, TP / (TP + FN) recall,  TP / (TP + FP) precision
FROM (
    SELECT
        COUNT_IF(label=1 AND prediction_result='1') TP,
        COUNT_IF(label=1 AND prediction_result!='1') FN,
        COUNT_IF(label=0 AND prediction_result='1') FP,
        COUNT_IF(label=0 AND prediction_result!='1') TN
    FROM ecommerce_gbdt_model_result_new
) T;

-- global auc
SELECT (ry - 0.5*n1*(n1+1))/n0/n1 as auc
FROM (
    SELECT
        SUM(IF(label=0, 1, 0)) n0,
        SUM(IF(label=1, 1, 0)) n1,
        SUM(IF(label=1, r, 0)) ry
    FROM (
        SELECT label, ROW_NUMBER() OVER(ORDER BY if(prediction_result='1', prediction_score, 1-prediction_score) ASC) as r
        FROM ecommerce_gbdt_model_result_new
    )
);

-- GAUC group AUC
SELECT AVG((ry - 0.5*n1*(n1+1))/n0/n1) as gauc
FROM (
    SELECT user_session,
        COUNT_IF(label=0) n0,
        COUNT_IF(label=1) n1,
        SUM(IF(label=1, r, 0)) ry
    FROM (
        SELECT  user_session, label, ROW_NUMBER() OVER(PARTITION BY user_session ORDER BY if(prediction_result='1', prediction_score, 1-prediction_score) ASC) as r
        FROM ecommerce_gbdt_model_result_new
    )
    GROUP BY user_session
)
WHERE n0 > 0 AND n1 > 0;
