CREATE TABLE IF NOT EXISTS ecommerce_item_min_price
(
    product_id    BIGINT,
    min_price     DOUBLE
)
COMMENT 'item table'
PARTITIONED BY (dt STRING COMMENT 'yyyymmdd')
;

INSERT OVERWRITE TABLE ecommerce_item_min_price PARTITION(dt)
SELECT product_id, min(price) min_price, dt
FROM ecommerce_behavior_table
WHERE dt > 0
group by dt, product_id;


CREATE TABLE IF NOT EXISTS ecommerce_item_min_price_di
(
    product_id    BIGINT,
    min_price     DOUBLE
)
COMMENT '到目前为止的全量商品'
PARTITIONED BY (dt STRING COMMENT 'yyyymmdd')
;

--下面这段sql需要代入不同的参数（业务日期）在所有业务日期上重复执行
INSERT OVERWRITE TABLE ecommerce_item_min_price_di PARTITION(dt='${bizdate}')
SELECT product_id, min_price
FROM (
    SELECT product_id, min_price, ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY dt DESC) rn
    FROM (
        SELECT product_id, min_price, dt
        FROM ecommerce_item_min_price_di
        WHERE dt = '${yesterday}'
        UNION ALL
        SELECT product_id, min_price, dt
        FROM ecommerce_item_min_price
        WHERE dt = '${bizdate}'
    )
)
WHERE rn=1;
