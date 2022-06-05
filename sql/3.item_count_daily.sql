-- 按业务日期统计商品、以及商品属性（看成是一种binning的结果）不同行为类型下的正、负样本数量
CREATE TABLE IF NOT EXISTS ecommerce_item_count_daily
(
    field_idx   BIGINT,
    event_type  STRING,
    total_cnt   BIGINT,
    positive_cnt BIGINT,
    probs       DOUBLE
)
COMMENT 'item field counting'
PARTITIONED BY (field STRING COMMENT 'field name', dt STRING COMMENT 'yyyymmdd')
;

FROM (
    SELECT *
    FROM ecommerce_behavior_wide_table
    WHERE dt > 0 AND event_type IN ('purchase', 'cart', 'view')
)
INSERT OVERWRITE TABLE ecommerce_item_count_daily PARTITION(field='product', dt)
SELECT product_idx, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, AVG(is_purchased) probs, dt
GROUP BY product_idx, event_type, dt

INSERT OVERWRITE TABLE ecommerce_item_count_daily PARTITION(field='price_level', dt)
SELECT price_level, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, AVG(is_purchased) probs, dt
GROUP BY price_level, event_type, dt

INSERT OVERWRITE TABLE ecommerce_item_count_daily PARTITION(field='cate_price_level', dt)
SELECT category_idx*10+price_level, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, AVG(is_purchased) probs, dt
GROUP BY category_idx, price_level, event_type, dt

INSERT OVERWRITE TABLE ecommerce_item_count_daily PARTITION(field='category', dt)
SELECT category_idx, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, AVG(is_purchased) probs, dt
GROUP BY category_idx, event_type, dt

INSERT OVERWRITE TABLE ecommerce_item_count_daily PARTITION(field='code', dt)
SELECT code_idx, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, AVG(is_purchased) probs, dt
GROUP BY code_idx, event_type, dt

INSERT OVERWRITE TABLE ecommerce_item_count_daily PARTITION(field='cat_0', dt)
SELECT cat_0_idx, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, AVG(is_purchased) probs, dt
GROUP BY cat_0_idx, event_type, dt

INSERT OVERWRITE TABLE ecommerce_item_count_daily PARTITION(field='cat_1', dt)
SELECT cat_1_idx, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, AVG(is_purchased) probs, dt
GROUP BY cat_1_idx, event_type, dt

INSERT OVERWRITE TABLE ecommerce_item_count_daily PARTITION(field='cat_2', dt)
SELECT cat_2_idx, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, AVG(is_purchased) probs, dt
GROUP BY cat_2_idx, event_type, dt

INSERT OVERWRITE TABLE ecommerce_item_count_daily PARTITION(field='brand', dt)
SELECT brand_idx, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, AVG(is_purchased) probs, dt
GROUP BY brand_idx, event_type, dt

INSERT OVERWRITE TABLE ecommerce_item_count_daily PARTITION(field='code_hour', dt)
SELECT code_idx*5+hour_bin, event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, AVG(is_purchased) probs, dt
GROUP BY code_idx, hour_bin, event_type, dt

INSERT OVERWRITE TABLE ecommerce_item_count_daily PARTITION(field='weekday_hour', dt)
SELECT BIGINT(split(weekday_hour, '_')[0])*5+BIGINT(split(weekday_hour, '_')[1]) AS weekday_hour_idx,
    event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, AVG(is_purchased) probs, dt
GROUP BY weekday_hour, event_type, dt

INSERT OVERWRITE TABLE ecommerce_item_count_daily PARTITION(field='cate_hour', dt)
SELECT category_idx*5+hour_bin AS weekday_hour_idx,
    event_type, COUNT(1) cnt, SUM(is_purchased) positive_cnt, AVG(is_purchased) probs, dt
GROUP BY category_idx, hour_bin, event_type, dt
;

-- 按照最近1天、3天、7天、30天的时间滑动窗口，统计不同field在不同`bin`在不同行为类型下的正负样本数量，以及当前field在不同类型的行为下全局正负样本数量
CREATE TABLE IF NOT EXISTS ecommerce_item_cumulate_count
(
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

INSERT OVERWRITE TABLE ecommerce_item_cumulate_count PARTITION(field, dt)
SELECT field_idx, event_type,
    total_cnt_1d, pos_cnt_1d, total_cnt_1d-pos_cnt_1d AS neg_cnt_1d,
    SUM(pos_cnt_1d) OVER(PARTITION BY dt, field, event_type) global_pos_cnt_1d,
    SUM(total_cnt_1d-pos_cnt_1d) OVER(PARTITION BY dt, field, event_type) global_neg_cnt_1d,
    total_cnt_3d, pos_cnt_3d, total_cnt_3d-pos_cnt_3d AS neg_cnt_3d,
    SUM(pos_cnt_3d) OVER(PARTITION BY dt, field, event_type) global_pos_cnt_3d,
    SUM(total_cnt_3d-pos_cnt_3d) OVER(PARTITION BY dt, field, event_type) global_neg_cnt_3d,
    total_cnt_7d, pos_cnt_7d, total_cnt_7d-pos_cnt_7d AS neg_cnt_7d,
    SUM(pos_cnt_7d) OVER(PARTITION BY dt, field, event_type) global_pos_cnt_7d,
    SUM(total_cnt_7d-pos_cnt_7d) OVER(PARTITION BY dt, field, event_type) global_neg_cnt_7d,
    total_cnt_30d, pos_cnt_30d, total_cnt_30d-pos_cnt_30d AS neg_cnt_30d,
    SUM(pos_cnt_30d) OVER(PARTITION BY dt, field, event_type) global_pos_cnt_30d,
    SUM(total_cnt_30d-pos_cnt_30d) OVER(PARTITION BY dt, field, event_type) global_neg_cnt_30d,
    field, dt
FROM (
    SELECT field_idx, event_type, total_cnt as total_cnt_1d, positive_cnt as pos_cnt_1d,
        SUM(total_cnt) OVER(PARTITION BY field, field_idx, event_type ORDER BY dt ASC ROWS 2 PRECEDING) total_cnt_3d,
        SUM(positive_cnt) OVER(PARTITION BY field, field_idx, event_type ORDER BY dt ASC ROWS 2 PRECEDING) pos_cnt_3d,
        SUM(total_cnt) OVER(PARTITION BY field, field_idx, event_type ORDER BY dt ASC ROWS 6 PRECEDING) total_cnt_7d,
        SUM(positive_cnt) OVER(PARTITION BY field, field_idx, event_type ORDER BY dt ASC ROWS 6 PRECEDING) pos_cnt_7d,
        SUM(total_cnt) OVER(PARTITION BY field, field_idx, event_type ORDER BY dt ASC ROWS 29 PRECEDING) total_cnt_30d,
        SUM(positive_cnt) OVER(PARTITION BY field, field_idx, event_type ORDER BY dt ASC ROWS 29 PRECEDING) pos_cnt_30d,
        field, dt
    FROM (
        SELECT field, event_type, field_idx, TO_CHAR(DATEADD(TO_DATE(dt, 'yyyymmdd'), delta, 'dd'), 'yyyymmdd') dt,
            SUM(BIGINT(NVL(total_cnt, 0))) total_cnt, SUM(BIGINT(NVL(positive_cnt, 0))) positive_cnt
        FROM (
            SELECT TRANS_ARRAY(4, ',', dt, field, event_type, field_idx, string(total_cnt), string(positive_cnt), range(0, 30))
                AS (dt, field, event_type, field_idx, total_cnt, positive_cnt, delta)
            FROM ecommerce_item_count_daily
            WHERE dt>0 AND field NOT IN ('weekday_hour', 'product') AND event_type != 'purchase'
        )
        GROUP BY TO_CHAR(DATEADD(TO_DATE(dt, 'yyyymmdd'), delta, 'dd'), 'yyyymmdd'), field, event_type, field_idx
    )
)
WHERE dt<'20200501';

INSERT OVERWRITE TABLE ecommerce_item_cumulate_count PARTITION(field, dt)
SELECT field_idx, event_type,
    total_cnt_1d, pos_cnt_1d, total_cnt_1d-pos_cnt_1d AS neg_cnt_1d,
    SUM(pos_cnt_1d) OVER(PARTITION BY dt, field, event_type) global_pos_cnt_1d,
    SUM(total_cnt_1d-pos_cnt_1d) OVER(PARTITION BY dt, field, event_type) global_neg_cnt_1d,
    total_cnt_3d, pos_cnt_3d, total_cnt_3d-pos_cnt_3d AS neg_cnt_3d,
    SUM(pos_cnt_3d) OVER(PARTITION BY dt, field, event_type) global_pos_cnt_3d,
    SUM(total_cnt_3d-pos_cnt_3d) OVER(PARTITION BY dt, field, event_type) global_neg_cnt_3d,
    total_cnt_7d, pos_cnt_7d, total_cnt_7d-pos_cnt_7d AS neg_cnt_7d,
    SUM(pos_cnt_7d) OVER(PARTITION BY dt, field, event_type) global_pos_cnt_7d,
    SUM(total_cnt_7d-pos_cnt_7d) OVER(PARTITION BY dt, field, event_type) global_neg_cnt_7d,
    total_cnt_30d, pos_cnt_30d, total_cnt_30d-pos_cnt_30d AS neg_cnt_30d,
    SUM(pos_cnt_30d) OVER(PARTITION BY dt, field, event_type) global_pos_cnt_30d,
    SUM(total_cnt_30d-pos_cnt_30d) OVER(PARTITION BY dt, field, event_type) global_neg_cnt_30d,
    field, dt
FROM (
    SELECT field_idx, event_type, total_cnt as total_cnt_1d, positive_cnt as pos_cnt_1d,
        SUM(total_cnt) OVER(PARTITION BY field, field_idx, event_type ORDER BY dt ASC ROWS 2 PRECEDING) total_cnt_3d,
        SUM(positive_cnt) OVER(PARTITION BY field, field_idx, event_type ORDER BY dt ASC ROWS 2 PRECEDING) pos_cnt_3d,
        SUM(total_cnt) OVER(PARTITION BY field, field_idx, event_type ORDER BY dt ASC ROWS 6 PRECEDING) total_cnt_7d,
        SUM(positive_cnt) OVER(PARTITION BY field, field_idx, event_type ORDER BY dt ASC ROWS 6 PRECEDING) pos_cnt_7d,
        SUM(total_cnt) OVER(PARTITION BY field, field_idx, event_type ORDER BY dt ASC ROWS 29 PRECEDING) total_cnt_30d,
        SUM(positive_cnt) OVER(PARTITION BY field, field_idx, event_type ORDER BY dt ASC ROWS 29 PRECEDING) pos_cnt_30d,
        field, dt
    FROM (
        SELECT field, event_type, field_idx, TO_CHAR(DATEADD(TO_DATE(dt, 'yyyymmdd'), delta, 'dd'), 'yyyymmdd') dt,
            SUM(BIGINT(NVL(total_cnt, 0))) total_cnt, SUM(BIGINT(NVL(positive_cnt, 0))) positive_cnt
        FROM (
            SELECT TRANS_ARRAY(4, ',', dt, field, event_type, field_idx, string(total_cnt), string(positive_cnt), range(0, 30))
                AS (dt, field, event_type, field_idx, total_cnt, positive_cnt, delta)
            FROM ecommerce_item_count_daily
            WHERE dt>0 AND field = 'product'
        )
        GROUP BY TO_CHAR(DATEADD(TO_DATE(dt, 'yyyymmdd'), delta, 'dd'), 'yyyymmdd'), field, event_type, field_idx
    )
)
WHERE dt<'20200501';