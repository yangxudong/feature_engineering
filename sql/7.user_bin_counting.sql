CREATE TABLE IF NOT EXISTS ecommerce_user_bin_count_v2
(
    user_id     BIGINT,
    field_idx   BIGINT,
    event_type  STRING,
    pos_ntile_1d BIGINT,
    neg_ntile_1d BIGINT,
    pos_ntile_3d BIGINT,
    neg_ntile_3d BIGINT,
    pos_ntile_7d BIGINT,
    neg_ntile_7d BIGINT,
    pos_ntile_30d BIGINT,
    neg_ntile_30d BIGINT,
    pos_gauss_rank_1d DOUBLE,
    neg_gauss_rank_1d DOUBLE,
    pos_gauss_rank_3d DOUBLE,
    neg_gauss_rank_3d DOUBLE,
    pos_gauss_rank_7d DOUBLE,
    neg_gauss_rank_7d DOUBLE,
    pos_gauss_rank_30d DOUBLE,
    neg_gauss_rank_30d DOUBLE,
    woe_1d DOUBLE,
    woe_3d DOUBLE,
    woe_7d DOUBLE,
    woe_30d DOUBLE,
    odds_1d DOUBLE,
    odds_3d DOUBLE,
    odds_7d DOUBLE,
    odds_30d DOUBLE,
    odds_ratio_1d DOUBLE,
    odds_ratio_3d DOUBLE,
    odds_ratio_7d DOUBLE,
    odds_ratio_30d DOUBLE
)
COMMENT 'item categorical feature bin count'
PARTITIONED BY (field STRING COMMENT 'field name', dt STRING COMMENT 'yyyymmdd')
;


INSERT OVERWRITE TABLE ecommerce_user_bin_count_v2 PARTITION(field, dt)
SELECT 30d.user_id, 30d.field_idx, 30d.event_type,
    nvl(pos_ntile_1d, 9), nvl(neg_ntile_1d, 9), nvl(pos_ntile_3d, 9), nvl(neg_ntile_3d, 9),
    nvl(pos_ntile_7d, 9), nvl(neg_ntile_7d, 9), nvl(pos_ntile_30d, 9), nvl(neg_ntile_30d, 9),
    nvl(pos_gauss_rank_1d, 0), nvl(neg_gauss_rank_1d, 0), nvl(pos_gauss_rank_3d, 0), nvl(neg_gauss_rank_3d, 0),
    nvl(pos_gauss_rank_7d, 0), nvl(neg_gauss_rank_7d, 0), nvl(pos_gauss_rank_30d, 0), nvl(neg_gauss_rank_30d, 0),
    nvl(woe_1d, 0), nvl(woe_3d, 0), nvl(woe_7d, 0), nvl(woe_30d, 0),
    nvl(odds_1d, 0), nvl(odds_3d, 0), nvl(odds_7d, 0), nvl(odds_30d, 0),
    nvl(odds_ratio_1d, 0), nvl(odds_ratio_3d, 0), nvl(odds_ratio_7d, 0), nvl(odds_ratio_30d, 0),
    30d.field, 30d.dt
FROM (
    SELECT dt, field, user_id, field_idx, event_type,
        pos_ntile_30d, neg_ntile_30d,
        GAUSS_RANK(pos_rank_30d) pos_gauss_rank_30d,
        GAUSS_RANK(neg_rank_30d) neg_gauss_rank_30d,
        LN(1e-6+pos_ratio_30d/(1e-6+neg_ratio_30d)) AS woe_30d,
        odds_30d, odds_ratio_30d
    FROM (
        SELECT dt, user_id, field, field_idx, event_type,
            NTILE(10) OVER(PARTITION BY dt, user_id, field, event_type ORDER BY pos_cnt_30d DESC)-1 AS pos_ntile_30d,
            NTILE(10) OVER(PARTITION BY dt, user_id, field, event_type ORDER BY neg_cnt_30d DESC)-1 AS neg_ntile_30d,
            PERCENT_RANK() OVER(PARTITION BY dt, user_id, field, event_type ORDER BY pos_cnt_30d DESC) AS pos_rank_30d,
            PERCENT_RANK() OVER(PARTITION BY dt, user_id, field, event_type ORDER BY neg_cnt_30d DESC) AS neg_rank_30d,
            if(global_pos_cnt_30d=0, 0, pos_cnt_30d/global_pos_cnt_30d) AS pos_ratio_30d,
            if(global_neg_cnt_30d=0, 0, neg_cnt_30d/global_neg_cnt_30d) AS neg_ratio_30d,
            LN(1e-6 + pos_cnt_30d)-LN(1e-6 + neg_cnt_30d) AS odds_30d,
            LN(1e-6+pos_cnt_30d)-LN(1e-6+neg_cnt_30d)-LN(1e-6+global_pos_cnt_30d-pos_cnt_30d)+LN(1e-6+global_neg_cnt_30d-neg_cnt_30d) AS odds_ratio_30d
        FROM ecommerce_user_cumulate_count
        where dt>='20191031' AND total_cnt_30d>0
    )
) 30d
LEFT JOIN (
    SELECT dt, field, user_id, field_idx, event_type,
        pos_ntile_7d, neg_ntile_7d,
        GAUSS_RANK(pos_rank_7d) pos_gauss_rank_7d,
        GAUSS_RANK(neg_rank_7d) neg_gauss_rank_7d,
        LN(1e-6+pos_ratio_7d/(1e-6+neg_ratio_7d)) AS woe_7d,
        odds_7d, odds_ratio_7d
    FROM (
        SELECT dt, user_id, field, field_idx, event_type,
            NTILE(10) OVER(PARTITION BY dt, user_id, field, event_type ORDER BY pos_cnt_7d DESC)-1 AS pos_ntile_7d,
            NTILE(10) OVER(PARTITION BY dt, user_id, field, event_type ORDER BY neg_cnt_7d DESC)-1 AS neg_ntile_7d,
            PERCENT_RANK() OVER(PARTITION BY dt, user_id, field, event_type ORDER BY pos_cnt_7d DESC) AS pos_rank_7d,
            PERCENT_RANK() OVER(PARTITION BY dt, user_id, field, event_type ORDER BY neg_cnt_7d DESC) AS neg_rank_7d,
            if(global_pos_cnt_7d=0, 0, pos_cnt_7d/global_pos_cnt_7d) AS pos_ratio_7d,
            if(global_neg_cnt_7d=0, 0, neg_cnt_7d/global_neg_cnt_7d) AS neg_ratio_7d,
            LN(1e-6 + pos_cnt_7d) - LN(1e-6 + neg_cnt_7d) AS odds_7d,
            LN(1e-6+pos_cnt_7d)-LN(1e-6+neg_cnt_7d)-LN(1e-6+global_pos_cnt_7d-pos_cnt_7d)+LN(1e-6+global_neg_cnt_7d-neg_cnt_7d) AS odds_ratio_7d
        FROM ecommerce_user_cumulate_count
        where dt>='20191031' AND total_cnt_7d>0
    )
) 7d
ON 30d.dt=7d.dt AND 30d.field=7d.field AND 30d.user_id=7d.user_id AND 30d.event_type=7d.event_type AND 30d.field_idx=7d.field_idx
LEFT JOIN (
    SELECT dt, field, user_id, field_idx, event_type,
        pos_ntile_3d, neg_ntile_3d,
        GAUSS_RANK(pos_rank_3d) pos_gauss_rank_3d,
        GAUSS_RANK(neg_rank_3d) neg_gauss_rank_3d,
        LN(1e-6+pos_ratio_3d/(1e-6+neg_ratio_3d)) AS woe_3d,
        odds_3d, odds_ratio_3d
    FROM (
        SELECT dt, user_id, field, field_idx, event_type,
            NTILE(10) OVER(PARTITION BY dt, user_id, field, event_type ORDER BY pos_cnt_3d DESC)-1 AS pos_ntile_3d,
            NTILE(10) OVER(PARTITION BY dt, user_id, field, event_type ORDER BY neg_cnt_3d DESC)-1 AS neg_ntile_3d,
            PERCENT_RANK() OVER(PARTITION BY dt, user_id, field, event_type ORDER BY pos_cnt_3d DESC) AS pos_rank_3d,
            PERCENT_RANK() OVER(PARTITION BY dt, user_id, field, event_type ORDER BY neg_cnt_3d DESC) AS neg_rank_3d,
            if(global_pos_cnt_3d=0, 0, pos_cnt_3d/global_pos_cnt_3d) AS pos_ratio_3d,
            if(global_neg_cnt_3d=0, 0, neg_cnt_3d/global_neg_cnt_3d) AS neg_ratio_3d,
            LN(1e-6 + pos_cnt_3d) - LN(1e-6 + neg_cnt_3d) AS odds_3d,
            LN(1e-6+pos_cnt_3d)-LN(1e-6+neg_cnt_3d)-LN(1e-6+global_pos_cnt_3d-pos_cnt_3d)+LN(1e-6+global_neg_cnt_3d-neg_cnt_3d) AS odds_ratio_3d
        FROM ecommerce_user_cumulate_count
        where dt>='20191031' AND total_cnt_3d>0
    )
) 3d
ON 30d.dt=3d.dt AND 30d.field=3d.field AND 30d.user_id=3d.user_id AND 30d.event_type=3d.event_type AND 30d.field_idx=3d.field_idx
LEFT JOIN (
    SELECT dt, field, user_id, field_idx, event_type,
        pos_ntile_1d, neg_ntile_1d,
        GAUSS_RANK(pos_rank_1d) pos_gauss_rank_1d,
        GAUSS_RANK(neg_rank_1d) neg_gauss_rank_1d,
        LN(1e-6+pos_ratio_1d/(1e-6+neg_ratio_1d)) AS woe_1d,
        odds_1d, odds_ratio_1d
    FROM (
        SELECT dt, user_id, field, field_idx, event_type,
            NTILE(10) OVER(PARTITION BY dt, user_id, field, event_type ORDER BY pos_cnt_1d DESC)-1 AS pos_ntile_1d,
            NTILE(10) OVER(PARTITION BY dt, user_id, field, event_type ORDER BY neg_cnt_1d DESC)-1 AS neg_ntile_1d,
            PERCENT_RANK() OVER(PARTITION BY dt, user_id, field, event_type ORDER BY pos_cnt_1d DESC) AS pos_rank_1d,
            PERCENT_RANK() OVER(PARTITION BY dt, user_id, field, event_type ORDER BY neg_cnt_1d DESC) AS neg_rank_1d,
            if(global_pos_cnt_1d=0, 0, pos_cnt_1d/global_pos_cnt_1d) AS pos_ratio_1d,
            if(global_neg_cnt_1d=0, 0, neg_cnt_1d/global_neg_cnt_1d) AS neg_ratio_1d,
            LN(1e-6 + pos_cnt_1d) - LN(1e-6 + neg_cnt_1d) AS odds_1d,
            LN(1e-6+pos_cnt_1d)-LN(1e-6+neg_cnt_1d)-LN(1e-6+global_pos_cnt_1d-pos_cnt_1d)+LN(1e-6+global_neg_cnt_1d-neg_cnt_1d) AS odds_ratio_1d
        FROM ecommerce_user_cumulate_count
        where dt>='20191031' AND total_cnt_1d>0
    )
) 1d
ON 30d.dt=1d.dt AND 30d.field=1d.field AND 30d.user_id=1d.user_id AND 30d.event_type=1d.event_type AND 30d.field_idx=1d.field_idx
;


--------------------------------------------------
CREATE TABLE IF NOT EXISTS ecommerce_user_purchase_count
(
    user_id     BIGINT,
    field_idx   BIGINT,
    purchase_cnt_1d    BIGINT,
    purchase_cnt_3d    BIGINT,
    purchase_cnt_7d    BIGINT,
    purchase_cnt_30d    BIGINT
)
COMMENT 'item catogorical feature bin count'
PARTITIONED BY (field STRING COMMENT 'field name', dt STRING COMMENT 'yyyymmdd')
;


INSERT OVERWRITE TABLE ecommerce_user_purchase_count PARTITION(field, dt)
SELECT user_id, field_idx,
    pos_cnt_1d,
    pos_cnt_3d,
    pos_cnt_7d,
    pos_cnt_30d,
    field, dt
FROM (
    SELECT user_id, field_idx, field, dt, positive_cnt as pos_cnt_1d,
        SUM(positive_cnt) OVER(PARTITION BY user_id, field, field_idx ORDER BY dt ASC ROWS 2 PRECEDING) pos_cnt_3d,
        SUM(positive_cnt) OVER(PARTITION BY user_id, field, field_idx ORDER BY dt ASC ROWS 6 PRECEDING) pos_cnt_7d,
        SUM(positive_cnt) OVER(PARTITION BY user_id, field, field_idx ORDER BY dt ASC ROWS 29 PRECEDING) pos_cnt_30d
    FROM (
        SELECT user_id, field, field_idx, TO_CHAR(DATEADD(TO_DATE(dt, 'yyyymmdd'), delta, 'dd'), 'yyyymmdd') dt,
            SUM(BIGINT(NVL(positive_cnt, 0))) positive_cnt
        FROM (
            SELECT TRANS_ARRAY(4, ',', dt, user_id, field, field_idx, string(positive_cnt), range(0, 30))
                AS (dt, user_id, field, field_idx, positive_cnt, delta)
            FROM ecommerce_user_count_daily
            WHERE dt>0 AND event_type = 'purchase'
        )
        GROUP BY user_id, field, field_idx, TO_CHAR(DATEADD(TO_DATE(dt, 'yyyymmdd'), delta, 'dd'), 'yyyymmdd')
    )
)
WHERE dt<='20200430';


CREATE TABLE IF NOT EXISTS ecommerce_user_purchase_gauss_rank
(
    user_id     BIGINT,
    field_idx   BIGINT,

    gauss_rank_1d DOUBLE,
    gauss_rank_3d DOUBLE,
    gauss_rank_7d DOUBLE,
    gauss_rank_30d DOUBLE
)
COMMENT 'user purchase feature'
PARTITIONED BY (field STRING COMMENT 'field name', dt STRING COMMENT 'yyyymmdd')
;

INSERT OVERWRITE TABLE ecommerce_user_purchase_gauss_rank PARTITION(field, dt)
SELECT A.user_id, A.field_idx, nvl(gauss_rank_1d, 0), nvl(gauss_rank_3d, 0),
    nvl(gauss_rank_7d, 0), nvl(gauss_rank_30d, 0), A.field, A.dt
FROM (
    SELECT field, dt, user_id, field_idx, GAUSS_RANK(rank_30d) gauss_rank_30d
    FROM (
        SELECT dt, user_id, field, field_idx,
            PERCENT_RANK() OVER(PARTITION BY dt, user_id, field ORDER BY purchase_cnt_30d DESC) AS rank_30d
        FROM ecommerce_user_purchase_count
        WHERE dt >= '20191031' AND purchase_cnt_30d > 0
    )
) A
LEFT JOIN (
    SELECT field, dt, user_id, field_idx, GAUSS_RANK(rank_7d) gauss_rank_7d
    FROM (
        SELECT dt, user_id, field, field_idx,
            PERCENT_RANK() OVER(PARTITION BY dt, user_id, field ORDER BY purchase_cnt_7d DESC) AS rank_7d
        FROM ecommerce_user_purchase_count
        WHERE dt >= '20191031' AND purchase_cnt_7d > 0
    )
) B
ON A.dt=B.dt AND A.user_id=B.user_id AND A.field=B.field AND A.field_idx=B.field_idx
LEFT JOIN (
    SELECT field, dt, user_id, field_idx, GAUSS_RANK(rank_3d) gauss_rank_3d
    FROM (
        SELECT dt, user_id, field, field_idx,
            PERCENT_RANK() OVER(PARTITION BY dt, user_id, field ORDER BY purchase_cnt_3d DESC) AS rank_3d
        FROM ecommerce_user_purchase_count
        WHERE dt >= '20191031' AND purchase_cnt_3d > 0
    )
) C
ON A.dt=C.dt AND A.user_id=C.user_id AND A.field=C.field AND A.field_idx=C.field_idx
LEFT JOIN (
    SELECT field, dt, user_id, field_idx, GAUSS_RANK(rank_1d) gauss_rank_1d
    FROM (
        SELECT dt, user_id, field, field_idx,
            PERCENT_RANK() OVER(PARTITION BY dt, user_id, field ORDER BY purchase_cnt_1d DESC) AS rank_1d
        FROM ecommerce_user_purchase_count
        WHERE dt >= '20191031' AND purchase_cnt_1d > 0
    )
) D
ON A.dt=D.dt AND A.user_id=D.user_id AND A.field=D.field AND A.field_idx=D.field_idx
;