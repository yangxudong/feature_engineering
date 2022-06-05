CREATE TABLE IF NOT EXISTS ecommerce_behavior
(
    event_time    STRING,
    event_type    STRING,
    product_id    BIGINT,
    category_id   BIGINT,
    category_code STRING,
    brand         STRING,
    price         DOUBLE,
    user_id       BIGINT,
    user_session  STRING
)
PARTITIONED BY
(
    dt            STRING
);

-- upload data by `tunnel upload` command

CREATE TABLE IF NOT EXISTS ecommerce_behavior_table
(
    event_time    DATETIME,
    event_type    STRING,
    product_id    BIGINT,
    category_id   BIGINT,
    category_code STRING,
    brand         STRING,
    price         DOUBLE,
    user_id       BIGINT,
    user_session  STRING,
    cat_0         STRING,
    cat_1         STRING,
    cat_2         STRING,
    cat_3         STRING,
    ts_hour       BIGINT,
    ts_weekday    BIGINT
)
PARTITIONED BY (dt STRING);

INSERT OVERWRITE TABLE ecommerce_behavior_table PARTITION(dt)
SELECT *, DATEPART(event_time,'hh') ts_hour, WEEKDAY(event_time) ts_weekday,
    TO_CHAR(event_time, 'yyyymmdd') as dt
FROM (
    SELECT DATETIME(replace(event_time, ' UTC', '')) as event_time,
        event_type, product_id, category_id, category_code, brand, price,
        user_id, user_session, split(category_code, '\\.')[0] cat_0,
        split(category_code, '\\.')[1] cat_1,
        split(category_code, '\\.')[2] cat_2,
        split(category_code, '\\.')[3] cat_3
    FROM ecommerce_behavior
    WHERE dt > 0
);

--以下代码为 norm_price （归一化的价格）特征做准备
CREATE TABLE IF NOT EXISTS category_price_info
(
    category_id BIGINT COMMENT '商品类目ID',
    avg_price DOUBLE COMMENT '当前类目下的平均价格',
    std_price DOUBLE COMMENT '当前类目下价格的标准差'
)
PARTITIONED BY (dt STRING COMMENT '日期')
;

INSERT OVERWRITE TABLE category_price_info PARTITION(dt)
SELECT category_id, AVG(price) avg_price, STDDEV_SAMP(price) std_price, dt
FROM ecommerce_item_table
WHERE dt>0 AND category_id IS NOT NULL AND price IS NOT NULL
GROUP BY dt, category_id;