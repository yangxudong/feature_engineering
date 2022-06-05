--http://help.aliyun-inc.com/internaldoc/detail/413557.html?spm=a2c1f.8259796.2.261.7b8e96d5pdo2Mf

CREATE TABLE IF NOT EXISTS ecommerce_lr_model4
(
    id  bigint COMMENT '特征ID',
    value DOUBLE COMMENT '特征权重'
);
-- 使用阿里云平台的PS算法框架训练LR模型（可直接在DataWorks里执行本文件内的代码）
param_server -a OptOwlqn
-i ecommerce_lr_train_instance
-o ecommerce_lr_model4
-extrastr {"worker_num":20,"worker_cpu":600,"worker_memory":8000,"server_num":2,"server_memory":8000,"server_cpu":600,"algorithm.class.conf":"{\"item_delimiter\":\",\",\"model_size\":9027,\"l1_weight\":1.0,\"objective_name\":\"ObjectiveDense\",\"tolerance\":1e-05}"}
;


ADD TABLE ecommerce_lr_model4 as lr_model_owlqn -f;

CREATE TABLE IF NOT EXISTS ecommerce_lr_model_result3
(
    user_id BIGINT,
    product_id BIGINT,
    user_session string,
    label    BIGINT,
    probs    DOUBLE
)
COMMENT 'ps lr model result'
;

INSERT OVERWRITE TABLE ecommerce_lr_model_result3
SELECT user_id, product_id, user_session, label, lr_predict(features) as probs
FROM ecommerce_lr_model_samples
WHERE dt='test';


-- global AUC
SELECT (ry - 0.5*n1*(n1+1))/n0/n1 as auc
FROM (
    SELECT
        SUM(IF(label!=1, 1, 0)) n0,
        SUM(IF(label=1, 1, 0)) n1,
        SUM(IF(label=1, r, 0)) ry
    FROM (
        SELECT label, probs, ROW_NUMBER() OVER(ORDER BY probs ASC) as r
        FROM ecommerce_lr_model_result3
    )
)
WHERE n0 > 0 AND n1 > 0;

-- GAUC group AUC
SELECT AVG((ry - 0.5*n1*(n1+1))/n0/n1) as gauc
FROM (
    SELECT user_session,
        COUNT_IF(label!=1) n0,
        COUNT_IF(label=1) n1,
        SUM(IF(label=1, r, 0)) ry
    FROM (
        SELECT user_session, label, probs, ROW_NUMBER() OVER(PARTITION BY user_session ORDER BY probs ASC) as r
        FROM ecommerce_lr_model_result3
    )
    GROUP BY user_session
)
WHERE n0 > 0 AND n1 > 0;


--precison, recall
SELECT *, TP / (TP + FN) recall,  TP / (TP + FP) precision
FROM (
    SELECT
        COUNT_IF(label=1 AND probs >= 0.5) TP,
        COUNT_IF(label=1 AND probs < 0.5) FN,
        COUNT_IF(label!=1 AND probs >= 0.5) FP,
        COUNT_IF(label!=1 AND probs < 0.5) TN
    FROM ecommerce_lr_model_result3
) T
;
