CREATE TABLE IF NOT EXISTS ecommerce_user_count_daily
(
    user_id     BIGINT,
    field_idx   BIGINT,
    event_type  STRING,
    total_cnt   BIGINT,
    positive_cnt BIGINT
)
COMMENT 'user count table'
PARTITIONED BY (field STRING COMMENT 'field name', dt STRING COMMENT 'yyyymmdd')
;


FROM (
    SELECT *
    FROM ecommerce_behavior_wide_table
    WHERE dt > 0 AND event_type IN ('purchase', 'cart', 'view')
)
INSERT OVERWRITE TABLE ecommerce_user_count_daily PARTITION(field='product', dt)
SELECT user_id, product_idx, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, dt
GROUP BY user_id, product_idx, event_type, dt

INSERT OVERWRITE TABLE ecommerce_user_count_daily PARTITION(field='category', dt)
SELECT user_id, category_idx, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, dt
GROUP BY user_id, category_idx, event_type, dt

INSERT OVERWRITE TABLE ecommerce_user_count_daily PARTITION(field='cat_0', dt)
SELECT user_id, cat_0_idx, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, dt
GROUP BY user_id, cat_0_idx, event_type, dt

INSERT OVERWRITE TABLE ecommerce_user_count_daily PARTITION(field='cat_1', dt)
SELECT user_id, cat_1_idx, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, dt
GROUP BY user_id, cat_1_idx, event_type, dt

INSERT OVERWRITE TABLE ecommerce_user_count_daily PARTITION(field='cat_2', dt)
SELECT user_id, cat_2_idx, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, dt
GROUP BY user_id, cat_2_idx, event_type, dt

INSERT OVERWRITE TABLE ecommerce_user_count_daily PARTITION(field='brand', dt)
SELECT user_id, brand_idx, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, dt
GROUP BY user_id, brand_idx, event_type, dt

INSERT OVERWRITE TABLE ecommerce_user_count_daily PARTITION(field='price_level', dt)
SELECT user_id, price_level, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, dt
GROUP BY user_id, price_level, event_type, dt

INSERT OVERWRITE TABLE ecommerce_user_count_daily PARTITION(field='cate_price_level', dt)
SELECT user_id, category_idx*10+price_level, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, dt
GROUP BY user_id, category_idx, price_level, event_type, dt

INSERT OVERWRITE TABLE ecommerce_user_count_daily PARTITION(field='code', dt)
SELECT user_id, code_idx, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, dt
GROUP BY user_id, code_idx, event_type, dt

INSERT OVERWRITE TABLE ecommerce_user_count_daily PARTITION(field='code_hour', dt)
SELECT user_id, code_idx*5+hour_bin, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, dt
GROUP BY user_id, code_idx, hour_bin, event_type, dt
;


--********************************************************************--
CREATE TABLE IF NOT EXISTS ecommerce_user_cumulate_count
(
    user_id     BIGINT,
    field_idx   BIGINT,
    event_type  STRING,

    total_cnt_1d    BIGINT,
    pos_cnt_1d      BIGINT,
    neg_cnt_1d      BIGINT,
    global_pos_cnt_1d BIGINT,
    global_neg_cnt_1d BIGINT,

    total_cnt_3d    BIGINT,
    pos_cnt_3d      BIGINT,
    neg_cnt_3d      BIGINT,
    global_pos_cnt_3d BIGINT,
    global_neg_cnt_3d BIGINT,

    total_cnt_7d    BIGINT,
    pos_cnt_7d      BIGINT,
    neg_cnt_7d        BIGINT,
    global_pos_cnt_7d BIGINT,
    global_neg_cnt_7d BIGINT,

    total_cnt_30d    BIGINT,
    pos_cnt_30d      BIGINT,
    neg_cnt_30d      BIGINT,
    global_pos_cnt_30d BIGINT,
    global_neg_cnt_30d BIGINT
)
COMMENT 'item categorical feature bin count'
PARTITIONED BY (field STRING COMMENT 'field name', dt STRING COMMENT 'yyyymmdd')
;

INSERT OVERWRITE TABLE ecommerce_user_cumulate_count PARTITION(field, dt)
SELECT user_id, field_idx, event_type,
    total_cnt_1d, pos_cnt_1d, total_cnt_1d-pos_cnt_1d AS neg_cnt_1d,
    SUM(pos_cnt_1d) OVER(PARTITION BY dt, user_id, field, event_type) global_pos_cnt_1d,
    SUM(total_cnt_1d-pos_cnt_1d) OVER(PARTITION BY dt, user_id, field, event_type) global_neg_cnt_1d,
    total_cnt_3d, pos_cnt_3d, total_cnt_3d-pos_cnt_3d AS neg_cnt_3d,
    SUM(pos_cnt_3d) OVER(PARTITION BY dt, user_id, field, event_type) global_pos_cnt_3d,
    SUM(total_cnt_3d-pos_cnt_3d) OVER(PARTITION BY dt, user_id, field, event_type) global_neg_cnt_3d,
    total_cnt_7d, pos_cnt_7d, total_cnt_7d-pos_cnt_7d AS neg_cnt_7d,
    SUM(pos_cnt_7d) OVER(PARTITION BY dt, user_id, field, event_type) global_pos_cnt_7d,
    SUM(total_cnt_7d-pos_cnt_7d) OVER(PARTITION BY dt, user_id, field, event_type) global_neg_cnt_7d,
    total_cnt_30d, pos_cnt_30d, total_cnt_30d-pos_cnt_30d AS neg_cnt_30d,
    SUM(pos_cnt_30d) OVER(PARTITION BY dt, user_id, field, event_type) global_pos_cnt_30d,
    SUM(total_cnt_30d-pos_cnt_30d) OVER(PARTITION BY dt, user_id, field, event_type) global_neg_cnt_30d,
    field, dt
FROM (
    SELECT user_id, field_idx, event_type, total_cnt as total_cnt_1d, positive_cnt as pos_cnt_1d,
        SUM(total_cnt) OVER(PARTITION BY user_id, field, field_idx, event_type ORDER BY dt ASC ROWS 2 PRECEDING) total_cnt_3d,
        SUM(positive_cnt) OVER(PARTITION BY user_id, field, field_idx, event_type ORDER BY dt ASC ROWS 2 PRECEDING) pos_cnt_3d,
        SUM(total_cnt) OVER(PARTITION BY user_id, field, field_idx, event_type ORDER BY dt ASC ROWS 6 PRECEDING) total_cnt_7d,
        SUM(positive_cnt) OVER(PARTITION BY user_id, field, field_idx, event_type ORDER BY dt ASC ROWS 6 PRECEDING) pos_cnt_7d,
        SUM(total_cnt) OVER(PARTITION BY user_id, field, field_idx, event_type ORDER BY dt ASC ROWS 29 PRECEDING) total_cnt_30d,
        SUM(positive_cnt) OVER(PARTITION BY user_id, field, field_idx, event_type ORDER BY dt ASC ROWS 29 PRECEDING) pos_cnt_30d,
        field, dt
    FROM (
        SELECT user_id, event_type, field, field_idx, TO_CHAR(DATEADD(TO_DATE(dt, 'yyyymmdd'), delta, 'dd'), 'yyyymmdd') dt,
            SUM(BIGINT(NVL(total_cnt, 0))) total_cnt, SUM(BIGINT(NVL(positive_cnt, 0))) positive_cnt
        FROM (
            SELECT TRANS_ARRAY(5, ',', dt, user_id, event_type, field, field_idx, string(total_cnt), string(positive_cnt), range(0, 30))
                AS (dt, user_id, event_type, field, field_idx, total_cnt, positive_cnt, delta)
            FROM ecommerce_user_count_daily
            WHERE dt>0 AND event_type != 'purchase'
        )
        GROUP BY user_id, event_type, field, field_idx, TO_CHAR(DATEADD(TO_DATE(dt, 'yyyymmdd'), delta, 'dd'), 'yyyymmdd')
    )
)
WHERE dt<='20200430';
