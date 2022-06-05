-- Modeling: predict at time of addition to shopping cart if user will purchase a given product or not。
-- Our goal is to predict if a user purchased an item:
--   Positive: User purchased an item
--   Negative: User added an item to the cart, but did not purchase it (in the same session)

-- 为样本设定学习目标（is_purchased）
CREATE VIEW IF NOT EXISTS ecommerce_session_purchase(@bizdate STRING)
AS
SELECT dt,NVL(user_session, 'UNKNOWN') user_session, user_id, product_id,
    MAX(IF(event_type="purchase", 1, 0)) is_purchased -- label
FROM ecommerce_behavior_table
WHERE dt>=@bizdate
GROUP BY dt,NVL(user_session, 'UNKNOWN'), user_id, product_id
;


CREATE VIEW IF NOT EXISTS ecommerce_behavior_view(@bizdate STRING)
AS
SELECT /*+MAPJOIN(C,D,E,F,G,T)*/
    A.*, product_idx, category_idx, brand_idx, cat_0_idx, cat_1_idx, cat_2_idx, price_level,
    nvl(avg_price, A.price) avg_price, nvl(std_price, 1.0) std_price, code_idx
FROM (
    SELECT `(rn)?+.+`,  CONCAT(ts_weekday, '_', hour_bin) as weekday_hour  --combo feature
    FROM (
        SELECT dt,
            event_time,
            event_type,
            product_id,
            category_id,
            NVL(category_code, 'UNKNOWN') category_code,
            NVL(brand, 'UNKNOWN') brand, -- fill missing value
            price,
            user_id,
            NVL(user_session, 'UNKNOWN') user_session,
            NVL(cat_0, 'UNKNOWN') cat_0,
            NVL(cat_1, 'UNKNOWN') cat_1,
            NVL(cat_2, 'UNKNOWN') cat_2,
            ts_hour,
            ts_weekday,
            CASE
                WHEN ts_hour<=3 THEN 0
                WHEN ts_hour<=7 THEN 1
                WHEN ts_hour<=14 THEN 2
                WHEN ts_hour<=20 THEN 3
                ELSE 4
            END AS hour_bin,
            ROW_NUMBER() OVER (PARTITION BY dt, user_id, user_session, product_id, event_type ORDER BY event_time DESC) rn
        FROM ecommerce_behavior_table
        WHERE dt>=@bizdate
    )
    WHERE rn=1 -- drop_duplicates
) A
LEFT JOIN (
    SELECT *
    FROM category_price_info
    WHERE dt>=@bizdate
) P
on A.dt=P.dt AND A.category_id=P.category_id
LEFT JOIN product_lookup_table B ON A.product_id=B.product_id
LEFT JOIN category_lookup_table C ON A.category_id=C.category_id
LEFT JOIN brand_lookup_table D ON A.brand=D.brand
LEFT JOIN cat_0_lookup_table E ON A.cat_0=E.cat_0
LEFT JOIN cat_1_lookup_table F ON A.cat_1=F.cat_1
LEFT JOIN cat_2_lookup_table G ON A.cat_2=G.cat_2
LEFT JOIN price_level_lookup_table H ON A.product_id=H.product_id AND A.category_id=H.category_id
LEFT JOIN taxonomy_lookup_table T ON A.category_code=T.category_code
;


CREATE TABLE IF NOT EXISTS ecommerce_behavior_wide_table
(
    is_purchased  BIGINT,
    event_time    datetime,
    event_type    string,
    product_id    bigint,
    category_id   bigint,
    category_code string,
    brand         string,
    price         double,
    user_id       bigint,
    user_session  string,
    cat_0         string,
    cat_1         string,
    cat_2         string,
    ts_hour       bigint,
    ts_weekday    bigint,
    hour_bin      bigint,
    weekday_hour  string,
    product_idx   bigint,
    category_idx  bigint,
    brand_idx     bigint,
    cat_0_idx     bigint,
    cat_1_idx     bigint,
    cat_2_idx     bigint,
    code_idx      bigint,
    price_level   bigint,
    activity_count BIGINT COMMENT 'number of activity in that session cumulating so far',
    norm_price    DOUBLE
)
COMMENT '样本宽表'
PARTITIONED BY (dt STRING COMMENT 'yyyymmdd')
;

INSERT OVERWRITE TABLE ecommerce_behavior_wide_table PARTITION(dt)
SELECT is_purchased, event_time, event_type, A.product_id, category_id, category_code, brand, price, A.user_id,
  A.user_session, cat_0, cat_1, cat_2, ts_hour, ts_weekday, hour_bin, weekday_hour, product_idx, category_idx,
  brand_idx, cat_0_idx, cat_1_idx, cat_2_idx, code_idx, price_level,
  SUM(IF(event_type IN ("purchase", "cart"), 1, 0)) OVER (PARTITION BY A.user_session ORDER BY event_time) as activity_count,
  if(std_price=0.0, 0.0, (price-avg_price)/std_price) as norm_price,
  A.dt
FROM ecommerce_behavior_view('0') A
JOIN ecommerce_session_purchase('0') B
ON A.dt=B.dt AND A.user_session = B.user_session AND A.product_id=B.product_id AND A.user_id=B.user_id
;
