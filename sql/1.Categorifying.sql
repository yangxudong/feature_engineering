-- *Categorifying* is required for using categorical features in deep learning models with Embedding layers.
-- An Embedding layer encodes the category into a hidden latent vector with a smaller dimension.

-- Categorical features can be from datatype String or Integer.
-- The Embedding layer requires that categorical features are continoues, positive Integers from 0 to |C| (number of unique category values).

CREATE TABLE IF NOT EXISTS ecommerce_item_table
(
    product_id    BIGINT,
    category_id   BIGINT,
    category_code STRING,
    brand         STRING,
    price         DOUBLE,
    cat_0         STRING,
    cat_1         STRING,
    cat_2         STRING,
    cat_3         STRING
)
COMMENT 'item table'
PARTITIONED BY (dt STRING COMMENT 'yyyymmdd')
;

INSERT OVERWRITE TABLE ecommerce_item_table PARTITION(dt)
SELECT `(rn)?+.+`
FROM (
    SELECT product_id, category_id, category_code, brand, price, cat_0, cat_1, cat_2, cat_3, dt,
        ROW_NUMBER() OVER(PARTITION BY dt,product_id ORDER BY event_time DESC) rn
    FROM ecommerce_behavior_table
    WHERE dt > 0
)
WHERE rn=1;

CREATE VIEW IF NOT EXISTS product_lookup_table AS
SELECT product_id, ROW_NUMBER() OVER() - 1 AS product_idx
FROM (
    SELECT DISTINCT product_id
    FROM ecommerce_item_table
    WHERE dt > 0
);

CREATE VIEW IF NOT EXISTS category_lookup_table AS
SELECT category_id, ROW_NUMBER() OVER() - 1 AS category_idx
FROM (
    SELECT DISTINCT category_id
    FROM ecommerce_item_table
    WHERE dt > 0
);

CREATE VIEW IF NOT EXISTS taxonomy_lookup_table AS
SELECT category_code, ROW_NUMBER() OVER() - 1 AS code_idx
FROM (
    SELECT DISTINCT NVL(category_code, 'UNKNOWN') category_code
    FROM ecommerce_item_table
    WHERE dt > 0
);

CREATE VIEW IF NOT EXISTS cat_0_lookup_table AS
SELECT cat_0, ROW_NUMBER() OVER() - 1 AS cat_0_idx
FROM (
    SELECT DISTINCT NVL(cat_0, 'UNKNOWN') cat_0
    FROM ecommerce_item_table
    WHERE dt > 0
);

CREATE VIEW IF NOT EXISTS cat_1_lookup_table AS
SELECT cat_1, ROW_NUMBER() OVER() - 1 AS cat_1_idx
FROM (
    SELECT DISTINCT NVL(cat_1, 'UNKNOWN') cat_1
    FROM ecommerce_item_table
    WHERE dt > 0
);

CREATE VIEW IF NOT EXISTS cat_2_lookup_table AS
SELECT cat_2, ROW_NUMBER() OVER() - 1 AS cat_2_idx
FROM (
    SELECT DISTINCT NVL(cat_2, 'UNKNOWN') cat_2
    FROM ecommerce_item_table
    WHERE dt > 0
);

CREATE VIEW IF NOT EXISTS brand_lookup_table AS
SELECT brand, ROW_NUMBER() OVER() - 1 AS brand_idx
FROM (
    SELECT DISTINCT NVL(brand, 'UNKNOWN') brand
    FROM ecommerce_item_table
    WHERE dt > 0
);

CREATE VIEW IF NOT EXISTS price_level_lookup_table AS
SELECT product_id, category_id, MIN(price_level) price_level
FROM (
    SELECT product_id, category_id,
        NTILE(10) OVER(PARTITION BY category_id ORDER BY price)-1 AS price_level --binning
    FROM (
        SELECT DISTINCT product_id, category_id, price
        FROM ecommerce_item_table
        WHERE dt > 0
    )
)
GROUP BY product_id, category_id;