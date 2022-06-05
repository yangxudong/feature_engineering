CREATE TABLE IF NOT EXISTS ecommerce_user_sample_v2
(
    is_purchased  BIGINT,
    product_id    bigint,
    user_id       bigint,
    user_session  STRING,
    ts_weekday    bigint,
    hour_bin      bigint,
    weekday_hour  BIGINT,
    product_idx   bigint,
    category_idx  bigint,
    brand_idx     bigint,
    cat_0_idx     bigint,
    cat_1_idx     bigint,
    cat_2_idx     bigint,
    code_idx      bigint,
    price_level   bigint,
    activity_count DOUBLE COMMENT 'normalized number of activity in that session cumulating so far',
    price         DOUBLE,
    norm_price    DOUBLE,
    -- user features
    user_item_view_pos_ntile_1d BIGINT,
    user_item_view_neg_ntile_1d BIGINT,
    user_item_view_pos_ntile_3d BIGINT,
    user_item_view_neg_ntile_3d BIGINT,
    user_item_view_pos_ntile_7d BIGINT,
    user_item_view_neg_ntile_7d BIGINT,
    user_item_view_pos_ntile_30d BIGINT,
    user_item_view_neg_ntile_30d BIGINT,
    user_item_view_pos_gauss_rank_1d DOUBLE,
    user_item_view_neg_gauss_rank_1d DOUBLE,
    user_item_view_pos_gauss_rank_3d DOUBLE,
    user_item_view_neg_gauss_rank_3d DOUBLE,
    user_item_view_pos_gauss_rank_7d DOUBLE,
    user_item_view_neg_gauss_rank_7d DOUBLE,
    user_item_view_pos_gauss_rank_30d DOUBLE,
    user_item_view_neg_gauss_rank_30d DOUBLE,
    user_item_view_woe_1d DOUBLE,
    user_item_view_woe_3d DOUBLE,
    user_item_view_woe_7d DOUBLE,
    user_item_view_woe_30d DOUBLE,
    user_item_view_odds_1d DOUBLE,
    user_item_view_odds_3d DOUBLE,
    user_item_view_odds_7d DOUBLE,
    user_item_view_odds_30d DOUBLE,
    user_item_view_odds_ratio_1d DOUBLE,
    user_item_view_odds_ratio_3d DOUBLE,
    user_item_view_odds_ratio_7d DOUBLE,
    user_item_view_odds_ratio_30d DOUBLE,
    user_item_cart_pos_ntile_1d BIGINT,
    user_item_cart_neg_ntile_1d BIGINT,
    user_item_cart_pos_ntile_3d BIGINT,
    user_item_cart_neg_ntile_3d BIGINT,
    user_item_cart_pos_ntile_7d BIGINT,
    user_item_cart_neg_ntile_7d BIGINT,
    user_item_cart_pos_ntile_30d BIGINT,
    user_item_cart_neg_ntile_30d BIGINT,
    user_item_cart_pos_gauss_rank_1d DOUBLE,
    user_item_cart_neg_gauss_rank_1d DOUBLE,
    user_item_cart_pos_gauss_rank_3d DOUBLE,
    user_item_cart_neg_gauss_rank_3d DOUBLE,
    user_item_cart_pos_gauss_rank_7d DOUBLE,
    user_item_cart_neg_gauss_rank_7d DOUBLE,
    user_item_cart_pos_gauss_rank_30d DOUBLE,
    user_item_cart_neg_gauss_rank_30d DOUBLE,
    user_item_cart_woe_1d DOUBLE,
    user_item_cart_woe_3d DOUBLE,
    user_item_cart_woe_7d DOUBLE,
    user_item_cart_woe_30d DOUBLE,
    user_item_cart_odds_1d DOUBLE,
    user_item_cart_odds_3d DOUBLE,
    user_item_cart_odds_7d DOUBLE,
    user_item_cart_odds_30d DOUBLE,
    user_item_cart_odds_ratio_1d DOUBLE,
    user_item_cart_odds_ratio_3d DOUBLE,
    user_item_cart_odds_ratio_7d DOUBLE,
    user_item_cart_odds_ratio_30d DOUBLE,
    user_item_purchase_gauss_rank_1d DOUBLE,
    user_item_purchase_gauss_rank_3d DOUBLE,
    user_item_purchase_gauss_rank_7d DOUBLE,
    user_item_purchase_gauss_rank_30d DOUBLE,
    user_price_level_view_pos_ntile_1d BIGINT,
    user_price_level_view_neg_ntile_1d BIGINT,
    user_price_level_view_pos_ntile_3d BIGINT,
    user_price_level_view_neg_ntile_3d BIGINT,
    user_price_level_view_pos_ntile_7d BIGINT,
    user_price_level_view_neg_ntile_7d BIGINT,
    user_price_level_view_pos_ntile_30d BIGINT,
    user_price_level_view_neg_ntile_30d BIGINT,
    user_price_level_view_pos_gauss_rank_1d DOUBLE,
    user_price_level_view_neg_gauss_rank_1d DOUBLE,
    user_price_level_view_pos_gauss_rank_3d DOUBLE,
    user_price_level_view_neg_gauss_rank_3d DOUBLE,
    user_price_level_view_pos_gauss_rank_7d DOUBLE,
    user_price_level_view_neg_gauss_rank_7d DOUBLE,
    user_price_level_view_pos_gauss_rank_30d DOUBLE,
    user_price_level_view_neg_gauss_rank_30d DOUBLE,
    user_price_level_view_woe_1d DOUBLE,
    user_price_level_view_woe_3d DOUBLE,
    user_price_level_view_woe_7d DOUBLE,
    user_price_level_view_woe_30d DOUBLE,
    user_price_level_view_odds_1d DOUBLE,
    user_price_level_view_odds_3d DOUBLE,
    user_price_level_view_odds_7d DOUBLE,
    user_price_level_view_odds_30d DOUBLE,
    user_price_level_view_odds_ratio_1d DOUBLE,
    user_price_level_view_odds_ratio_3d DOUBLE,
    user_price_level_view_odds_ratio_7d DOUBLE,
    user_price_level_view_odds_ratio_30d DOUBLE,
    user_price_level_cart_pos_ntile_1d BIGINT,
    user_price_level_cart_neg_ntile_1d BIGINT,
    user_price_level_cart_pos_ntile_3d BIGINT,
    user_price_level_cart_neg_ntile_3d BIGINT,
    user_price_level_cart_pos_ntile_7d BIGINT,
    user_price_level_cart_neg_ntile_7d BIGINT,
    user_price_level_cart_pos_ntile_30d BIGINT,
    user_price_level_cart_neg_ntile_30d BIGINT,
    user_price_level_cart_pos_gauss_rank_1d DOUBLE,
    user_price_level_cart_neg_gauss_rank_1d DOUBLE,
    user_price_level_cart_pos_gauss_rank_3d DOUBLE,
    user_price_level_cart_neg_gauss_rank_3d DOUBLE,
    user_price_level_cart_pos_gauss_rank_7d DOUBLE,
    user_price_level_cart_neg_gauss_rank_7d DOUBLE,
    user_price_level_cart_pos_gauss_rank_30d DOUBLE,
    user_price_level_cart_neg_gauss_rank_30d DOUBLE,
    user_price_level_cart_woe_1d DOUBLE,
    user_price_level_cart_woe_3d DOUBLE,
    user_price_level_cart_woe_7d DOUBLE,
    user_price_level_cart_woe_30d DOUBLE,
    user_price_level_cart_odds_1d DOUBLE,
    user_price_level_cart_odds_3d DOUBLE,
    user_price_level_cart_odds_7d DOUBLE,
    user_price_level_cart_odds_30d DOUBLE,
    user_price_level_cart_odds_ratio_1d DOUBLE,
    user_price_level_cart_odds_ratio_3d DOUBLE,
    user_price_level_cart_odds_ratio_7d DOUBLE,
    user_price_level_cart_odds_ratio_30d DOUBLE,
    user_price_level_purchase_gauss_rank_1d DOUBLE,
    user_price_level_purchase_gauss_rank_3d DOUBLE,
    user_price_level_purchase_gauss_rank_7d DOUBLE,
    user_price_level_purchase_gauss_rank_30d DOUBLE,
    user_category_view_pos_ntile_1d BIGINT,
    user_category_view_neg_ntile_1d BIGINT,
    user_category_view_pos_ntile_3d BIGINT,
    user_category_view_neg_ntile_3d BIGINT,
    user_category_view_pos_ntile_7d BIGINT,
    user_category_view_neg_ntile_7d BIGINT,
    user_category_view_pos_ntile_30d BIGINT,
    user_category_view_neg_ntile_30d BIGINT,
    user_category_view_pos_gauss_rank_1d DOUBLE,
    user_category_view_neg_gauss_rank_1d DOUBLE,
    user_category_view_pos_gauss_rank_3d DOUBLE,
    user_category_view_neg_gauss_rank_3d DOUBLE,
    user_category_view_pos_gauss_rank_7d DOUBLE,
    user_category_view_neg_gauss_rank_7d DOUBLE,
    user_category_view_pos_gauss_rank_30d DOUBLE,
    user_category_view_neg_gauss_rank_30d DOUBLE,
    user_category_view_woe_1d DOUBLE,
    user_category_view_woe_3d DOUBLE,
    user_category_view_woe_7d DOUBLE,
    user_category_view_woe_30d DOUBLE,
    user_category_view_odds_1d DOUBLE,
    user_category_view_odds_3d DOUBLE,
    user_category_view_odds_7d DOUBLE,
    user_category_view_odds_30d DOUBLE,
    user_category_view_odds_ratio_1d DOUBLE,
    user_category_view_odds_ratio_3d DOUBLE,
    user_category_view_odds_ratio_7d DOUBLE,
    user_category_view_odds_ratio_30d DOUBLE,
    user_category_cart_pos_ntile_1d BIGINT,
    user_category_cart_neg_ntile_1d BIGINT,
    user_category_cart_pos_ntile_3d BIGINT,
    user_category_cart_neg_ntile_3d BIGINT,
    user_category_cart_pos_ntile_7d BIGINT,
    user_category_cart_neg_ntile_7d BIGINT,
    user_category_cart_pos_ntile_30d BIGINT,
    user_category_cart_neg_ntile_30d BIGINT,
    user_category_cart_pos_gauss_rank_1d DOUBLE,
    user_category_cart_neg_gauss_rank_1d DOUBLE,
    user_category_cart_pos_gauss_rank_3d DOUBLE,
    user_category_cart_neg_gauss_rank_3d DOUBLE,
    user_category_cart_pos_gauss_rank_7d DOUBLE,
    user_category_cart_neg_gauss_rank_7d DOUBLE,
    user_category_cart_pos_gauss_rank_30d DOUBLE,
    user_category_cart_neg_gauss_rank_30d DOUBLE,
    user_category_cart_woe_1d DOUBLE,
    user_category_cart_woe_3d DOUBLE,
    user_category_cart_woe_7d DOUBLE,
    user_category_cart_woe_30d DOUBLE,
    user_category_cart_odds_1d DOUBLE,
    user_category_cart_odds_3d DOUBLE,
    user_category_cart_odds_7d DOUBLE,
    user_category_cart_odds_30d DOUBLE,
    user_category_cart_odds_ratio_1d DOUBLE,
    user_category_cart_odds_ratio_3d DOUBLE,
    user_category_cart_odds_ratio_7d DOUBLE,
    user_category_cart_odds_ratio_30d DOUBLE,
    user_category_purchase_gauss_rank_1d DOUBLE,
    user_category_purchase_gauss_rank_3d DOUBLE,
    user_category_purchase_gauss_rank_7d DOUBLE,
    user_category_purchase_gauss_rank_30d DOUBLE,
    user_cat_0_view_pos_ntile_1d BIGINT,
    user_cat_0_view_neg_ntile_1d BIGINT,
    user_cat_0_view_pos_ntile_3d BIGINT,
    user_cat_0_view_neg_ntile_3d BIGINT,
    user_cat_0_view_pos_ntile_7d BIGINT,
    user_cat_0_view_neg_ntile_7d BIGINT,
    user_cat_0_view_pos_ntile_30d BIGINT,
    user_cat_0_view_neg_ntile_30d BIGINT,
    user_cat_0_view_pos_gauss_rank_1d DOUBLE,
    user_cat_0_view_neg_gauss_rank_1d DOUBLE,
    user_cat_0_view_pos_gauss_rank_3d DOUBLE,
    user_cat_0_view_neg_gauss_rank_3d DOUBLE,
    user_cat_0_view_pos_gauss_rank_7d DOUBLE,
    user_cat_0_view_neg_gauss_rank_7d DOUBLE,
    user_cat_0_view_pos_gauss_rank_30d DOUBLE,
    user_cat_0_view_neg_gauss_rank_30d DOUBLE,
    user_cat_0_view_woe_1d DOUBLE,
    user_cat_0_view_woe_3d DOUBLE,
    user_cat_0_view_woe_7d DOUBLE,
    user_cat_0_view_woe_30d DOUBLE,
    user_cat_0_view_odds_1d DOUBLE,
    user_cat_0_view_odds_3d DOUBLE,
    user_cat_0_view_odds_7d DOUBLE,
    user_cat_0_view_odds_30d DOUBLE,
    user_cat_0_view_odds_ratio_1d DOUBLE,
    user_cat_0_view_odds_ratio_3d DOUBLE,
    user_cat_0_view_odds_ratio_7d DOUBLE,
    user_cat_0_view_odds_ratio_30d DOUBLE,
    user_cat_0_cart_pos_ntile_1d BIGINT,
    user_cat_0_cart_neg_ntile_1d BIGINT,
    user_cat_0_cart_pos_ntile_3d BIGINT,
    user_cat_0_cart_neg_ntile_3d BIGINT,
    user_cat_0_cart_pos_ntile_7d BIGINT,
    user_cat_0_cart_neg_ntile_7d BIGINT,
    user_cat_0_cart_pos_ntile_30d BIGINT,
    user_cat_0_cart_neg_ntile_30d BIGINT,
    user_cat_0_cart_pos_gauss_rank_1d DOUBLE,
    user_cat_0_cart_neg_gauss_rank_1d DOUBLE,
    user_cat_0_cart_pos_gauss_rank_3d DOUBLE,
    user_cat_0_cart_neg_gauss_rank_3d DOUBLE,
    user_cat_0_cart_pos_gauss_rank_7d DOUBLE,
    user_cat_0_cart_neg_gauss_rank_7d DOUBLE,
    user_cat_0_cart_pos_gauss_rank_30d DOUBLE,
    user_cat_0_cart_neg_gauss_rank_30d DOUBLE,
    user_cat_0_cart_woe_1d DOUBLE,
    user_cat_0_cart_woe_3d DOUBLE,
    user_cat_0_cart_woe_7d DOUBLE,
    user_cat_0_cart_woe_30d DOUBLE,
    user_cat_0_cart_odds_1d DOUBLE,
    user_cat_0_cart_odds_3d DOUBLE,
    user_cat_0_cart_odds_7d DOUBLE,
    user_cat_0_cart_odds_30d DOUBLE,
    user_cat_0_cart_odds_ratio_1d DOUBLE,
    user_cat_0_cart_odds_ratio_3d DOUBLE,
    user_cat_0_cart_odds_ratio_7d DOUBLE,
    user_cat_0_cart_odds_ratio_30d DOUBLE,
    user_cat_0_purchase_gauss_rank_1d DOUBLE,
    user_cat_0_purchase_gauss_rank_3d DOUBLE,
    user_cat_0_purchase_gauss_rank_7d DOUBLE,
    user_cat_0_purchase_gauss_rank_30d DOUBLE,
    user_cat_1_view_pos_ntile_1d BIGINT,
    user_cat_1_view_neg_ntile_1d BIGINT,
    user_cat_1_view_pos_ntile_3d BIGINT,
    user_cat_1_view_neg_ntile_3d BIGINT,
    user_cat_1_view_pos_ntile_7d BIGINT,
    user_cat_1_view_neg_ntile_7d BIGINT,
    user_cat_1_view_pos_ntile_30d BIGINT,
    user_cat_1_view_neg_ntile_30d BIGINT,
    user_cat_1_view_pos_gauss_rank_1d DOUBLE,
    user_cat_1_view_neg_gauss_rank_1d DOUBLE,
    user_cat_1_view_pos_gauss_rank_3d DOUBLE,
    user_cat_1_view_neg_gauss_rank_3d DOUBLE,
    user_cat_1_view_pos_gauss_rank_7d DOUBLE,
    user_cat_1_view_neg_gauss_rank_7d DOUBLE,
    user_cat_1_view_pos_gauss_rank_30d DOUBLE,
    user_cat_1_view_neg_gauss_rank_30d DOUBLE,
    user_cat_1_view_woe_1d DOUBLE,
    user_cat_1_view_woe_3d DOUBLE,
    user_cat_1_view_woe_7d DOUBLE,
    user_cat_1_view_woe_30d DOUBLE,
    user_cat_1_view_odds_1d DOUBLE,
    user_cat_1_view_odds_3d DOUBLE,
    user_cat_1_view_odds_7d DOUBLE,
    user_cat_1_view_odds_30d DOUBLE,
    user_cat_1_view_odds_ratio_1d DOUBLE,
    user_cat_1_view_odds_ratio_3d DOUBLE,
    user_cat_1_view_odds_ratio_7d DOUBLE,
    user_cat_1_view_odds_ratio_30d DOUBLE,
    user_cat_1_cart_pos_ntile_1d BIGINT,
    user_cat_1_cart_neg_ntile_1d BIGINT,
    user_cat_1_cart_pos_ntile_3d BIGINT,
    user_cat_1_cart_neg_ntile_3d BIGINT,
    user_cat_1_cart_pos_ntile_7d BIGINT,
    user_cat_1_cart_neg_ntile_7d BIGINT,
    user_cat_1_cart_pos_ntile_30d BIGINT,
    user_cat_1_cart_neg_ntile_30d BIGINT,
    user_cat_1_cart_pos_gauss_rank_1d DOUBLE,
    user_cat_1_cart_neg_gauss_rank_1d DOUBLE,
    user_cat_1_cart_pos_gauss_rank_3d DOUBLE,
    user_cat_1_cart_neg_gauss_rank_3d DOUBLE,
    user_cat_1_cart_pos_gauss_rank_7d DOUBLE,
    user_cat_1_cart_neg_gauss_rank_7d DOUBLE,
    user_cat_1_cart_pos_gauss_rank_30d DOUBLE,
    user_cat_1_cart_neg_gauss_rank_30d DOUBLE,
    user_cat_1_cart_woe_1d DOUBLE,
    user_cat_1_cart_woe_3d DOUBLE,
    user_cat_1_cart_woe_7d DOUBLE,
    user_cat_1_cart_woe_30d DOUBLE,
    user_cat_1_cart_odds_1d DOUBLE,
    user_cat_1_cart_odds_3d DOUBLE,
    user_cat_1_cart_odds_7d DOUBLE,
    user_cat_1_cart_odds_30d DOUBLE,
    user_cat_1_cart_odds_ratio_1d DOUBLE,
    user_cat_1_cart_odds_ratio_3d DOUBLE,
    user_cat_1_cart_odds_ratio_7d DOUBLE,
    user_cat_1_cart_odds_ratio_30d DOUBLE,
    user_cat_1_purchase_gauss_rank_1d DOUBLE,
    user_cat_1_purchase_gauss_rank_3d DOUBLE,
    user_cat_1_purchase_gauss_rank_7d DOUBLE,
    user_cat_1_purchase_gauss_rank_30d DOUBLE,
    user_cat_2_view_pos_ntile_1d BIGINT,
    user_cat_2_view_neg_ntile_1d BIGINT,
    user_cat_2_view_pos_ntile_3d BIGINT,
    user_cat_2_view_neg_ntile_3d BIGINT,
    user_cat_2_view_pos_ntile_7d BIGINT,
    user_cat_2_view_neg_ntile_7d BIGINT,
    user_cat_2_view_pos_ntile_30d BIGINT,
    user_cat_2_view_neg_ntile_30d BIGINT,
    user_cat_2_view_pos_gauss_rank_1d DOUBLE,
    user_cat_2_view_neg_gauss_rank_1d DOUBLE,
    user_cat_2_view_pos_gauss_rank_3d DOUBLE,
    user_cat_2_view_neg_gauss_rank_3d DOUBLE,
    user_cat_2_view_pos_gauss_rank_7d DOUBLE,
    user_cat_2_view_neg_gauss_rank_7d DOUBLE,
    user_cat_2_view_pos_gauss_rank_30d DOUBLE,
    user_cat_2_view_neg_gauss_rank_30d DOUBLE,
    user_cat_2_view_woe_1d DOUBLE,
    user_cat_2_view_woe_3d DOUBLE,
    user_cat_2_view_woe_7d DOUBLE,
    user_cat_2_view_woe_30d DOUBLE,
    user_cat_2_view_odds_1d DOUBLE,
    user_cat_2_view_odds_3d DOUBLE,
    user_cat_2_view_odds_7d DOUBLE,
    user_cat_2_view_odds_30d DOUBLE,
    user_cat_2_view_odds_ratio_1d DOUBLE,
    user_cat_2_view_odds_ratio_3d DOUBLE,
    user_cat_2_view_odds_ratio_7d DOUBLE,
    user_cat_2_view_odds_ratio_30d DOUBLE,
    user_cat_2_cart_pos_ntile_1d BIGINT,
    user_cat_2_cart_neg_ntile_1d BIGINT,
    user_cat_2_cart_pos_ntile_3d BIGINT,
    user_cat_2_cart_neg_ntile_3d BIGINT,
    user_cat_2_cart_pos_ntile_7d BIGINT,
    user_cat_2_cart_neg_ntile_7d BIGINT,
    user_cat_2_cart_pos_ntile_30d BIGINT,
    user_cat_2_cart_neg_ntile_30d BIGINT,
    user_cat_2_cart_pos_gauss_rank_1d DOUBLE,
    user_cat_2_cart_neg_gauss_rank_1d DOUBLE,
    user_cat_2_cart_pos_gauss_rank_3d DOUBLE,
    user_cat_2_cart_neg_gauss_rank_3d DOUBLE,
    user_cat_2_cart_pos_gauss_rank_7d DOUBLE,
    user_cat_2_cart_neg_gauss_rank_7d DOUBLE,
    user_cat_2_cart_pos_gauss_rank_30d DOUBLE,
    user_cat_2_cart_neg_gauss_rank_30d DOUBLE,
    user_cat_2_cart_woe_1d DOUBLE,
    user_cat_2_cart_woe_3d DOUBLE,
    user_cat_2_cart_woe_7d DOUBLE,
    user_cat_2_cart_woe_30d DOUBLE,
    user_cat_2_cart_odds_1d DOUBLE,
    user_cat_2_cart_odds_3d DOUBLE,
    user_cat_2_cart_odds_7d DOUBLE,
    user_cat_2_cart_odds_30d DOUBLE,
    user_cat_2_cart_odds_ratio_1d DOUBLE,
    user_cat_2_cart_odds_ratio_3d DOUBLE,
    user_cat_2_cart_odds_ratio_7d DOUBLE,
    user_cat_2_cart_odds_ratio_30d DOUBLE,
    user_cat_2_purchase_gauss_rank_1d DOUBLE,
    user_cat_2_purchase_gauss_rank_3d DOUBLE,
    user_cat_2_purchase_gauss_rank_7d DOUBLE,
    user_cat_2_purchase_gauss_rank_30d DOUBLE,
    user_brand_view_pos_ntile_1d BIGINT,
    user_brand_view_neg_ntile_1d BIGINT,
    user_brand_view_pos_ntile_3d BIGINT,
    user_brand_view_neg_ntile_3d BIGINT,
    user_brand_view_pos_ntile_7d BIGINT,
    user_brand_view_neg_ntile_7d BIGINT,
    user_brand_view_pos_ntile_30d BIGINT,
    user_brand_view_neg_ntile_30d BIGINT,
    user_brand_view_pos_gauss_rank_1d DOUBLE,
    user_brand_view_neg_gauss_rank_1d DOUBLE,
    user_brand_view_pos_gauss_rank_3d DOUBLE,
    user_brand_view_neg_gauss_rank_3d DOUBLE,
    user_brand_view_pos_gauss_rank_7d DOUBLE,
    user_brand_view_neg_gauss_rank_7d DOUBLE,
    user_brand_view_pos_gauss_rank_30d DOUBLE,
    user_brand_view_neg_gauss_rank_30d DOUBLE,
    user_brand_view_woe_1d DOUBLE,
    user_brand_view_woe_3d DOUBLE,
    user_brand_view_woe_7d DOUBLE,
    user_brand_view_woe_30d DOUBLE,
    user_brand_view_odds_1d DOUBLE,
    user_brand_view_odds_3d DOUBLE,
    user_brand_view_odds_7d DOUBLE,
    user_brand_view_odds_30d DOUBLE,
    user_brand_view_odds_ratio_1d DOUBLE,
    user_brand_view_odds_ratio_3d DOUBLE,
    user_brand_view_odds_ratio_7d DOUBLE,
    user_brand_view_odds_ratio_30d DOUBLE,
    user_brand_cart_pos_ntile_1d BIGINT,
    user_brand_cart_neg_ntile_1d BIGINT,
    user_brand_cart_pos_ntile_3d BIGINT,
    user_brand_cart_neg_ntile_3d BIGINT,
    user_brand_cart_pos_ntile_7d BIGINT,
    user_brand_cart_neg_ntile_7d BIGINT,
    user_brand_cart_pos_ntile_30d BIGINT,
    user_brand_cart_neg_ntile_30d BIGINT,
    user_brand_cart_pos_gauss_rank_1d DOUBLE,
    user_brand_cart_neg_gauss_rank_1d DOUBLE,
    user_brand_cart_pos_gauss_rank_3d DOUBLE,
    user_brand_cart_neg_gauss_rank_3d DOUBLE,
    user_brand_cart_pos_gauss_rank_7d DOUBLE,
    user_brand_cart_neg_gauss_rank_7d DOUBLE,
    user_brand_cart_pos_gauss_rank_30d DOUBLE,
    user_brand_cart_neg_gauss_rank_30d DOUBLE,
    user_brand_cart_woe_1d DOUBLE,
    user_brand_cart_woe_3d DOUBLE,
    user_brand_cart_woe_7d DOUBLE,
    user_brand_cart_woe_30d DOUBLE,
    user_brand_cart_odds_1d DOUBLE,
    user_brand_cart_odds_3d DOUBLE,
    user_brand_cart_odds_7d DOUBLE,
    user_brand_cart_odds_30d DOUBLE,
    user_brand_cart_odds_ratio_1d DOUBLE,
    user_brand_cart_odds_ratio_3d DOUBLE,
    user_brand_cart_odds_ratio_7d DOUBLE,
    user_brand_cart_odds_ratio_30d DOUBLE,
    user_brand_purchase_gauss_rank_1d DOUBLE,
    user_brand_purchase_gauss_rank_3d DOUBLE,
    user_brand_purchase_gauss_rank_7d DOUBLE,
    user_brand_purchase_gauss_rank_30d DOUBLE,
    user_code_view_pos_ntile_1d BIGINT,
    user_code_view_neg_ntile_1d BIGINT,
    user_code_view_pos_ntile_3d BIGINT,
    user_code_view_neg_ntile_3d BIGINT,
    user_code_view_pos_ntile_7d BIGINT,
    user_code_view_neg_ntile_7d BIGINT,
    user_code_view_pos_ntile_30d BIGINT,
    user_code_view_neg_ntile_30d BIGINT,
    user_code_view_pos_gauss_rank_1d DOUBLE,
    user_code_view_neg_gauss_rank_1d DOUBLE,
    user_code_view_pos_gauss_rank_3d DOUBLE,
    user_code_view_neg_gauss_rank_3d DOUBLE,
    user_code_view_pos_gauss_rank_7d DOUBLE,
    user_code_view_neg_gauss_rank_7d DOUBLE,
    user_code_view_pos_gauss_rank_30d DOUBLE,
    user_code_view_neg_gauss_rank_30d DOUBLE,
    user_code_view_woe_1d DOUBLE,
    user_code_view_woe_3d DOUBLE,
    user_code_view_woe_7d DOUBLE,
    user_code_view_woe_30d DOUBLE,
    user_code_view_odds_1d DOUBLE,
    user_code_view_odds_3d DOUBLE,
    user_code_view_odds_7d DOUBLE,
    user_code_view_odds_30d DOUBLE,
    user_code_view_odds_ratio_1d DOUBLE,
    user_code_view_odds_ratio_3d DOUBLE,
    user_code_view_odds_ratio_7d DOUBLE,
    user_code_view_odds_ratio_30d DOUBLE,
    user_code_cart_pos_ntile_1d BIGINT,
    user_code_cart_neg_ntile_1d BIGINT,
    user_code_cart_pos_ntile_3d BIGINT,
    user_code_cart_neg_ntile_3d BIGINT,
    user_code_cart_pos_ntile_7d BIGINT,
    user_code_cart_neg_ntile_7d BIGINT,
    user_code_cart_pos_ntile_30d BIGINT,
    user_code_cart_neg_ntile_30d BIGINT,
    user_code_cart_pos_gauss_rank_1d DOUBLE,
    user_code_cart_neg_gauss_rank_1d DOUBLE,
    user_code_cart_pos_gauss_rank_3d DOUBLE,
    user_code_cart_neg_gauss_rank_3d DOUBLE,
    user_code_cart_pos_gauss_rank_7d DOUBLE,
    user_code_cart_neg_gauss_rank_7d DOUBLE,
    user_code_cart_pos_gauss_rank_30d DOUBLE,
    user_code_cart_neg_gauss_rank_30d DOUBLE,
    user_code_cart_woe_1d DOUBLE,
    user_code_cart_woe_3d DOUBLE,
    user_code_cart_woe_7d DOUBLE,
    user_code_cart_woe_30d DOUBLE,
    user_code_cart_odds_1d DOUBLE,
    user_code_cart_odds_3d DOUBLE,
    user_code_cart_odds_7d DOUBLE,
    user_code_cart_odds_30d DOUBLE,
    user_code_cart_odds_ratio_1d DOUBLE,
    user_code_cart_odds_ratio_3d DOUBLE,
    user_code_cart_odds_ratio_7d DOUBLE,
    user_code_cart_odds_ratio_30d DOUBLE,
    user_code_purchase_gauss_rank_1d DOUBLE,
    user_code_purchase_gauss_rank_3d DOUBLE,
    user_code_purchase_gauss_rank_7d DOUBLE,
    user_code_purchase_gauss_rank_30d DOUBLE,
    user_code_hour_view_pos_ntile_1d BIGINT,
    user_code_hour_view_neg_ntile_1d BIGINT,
    user_code_hour_view_pos_ntile_3d BIGINT,
    user_code_hour_view_neg_ntile_3d BIGINT,
    user_code_hour_view_pos_ntile_7d BIGINT,
    user_code_hour_view_neg_ntile_7d BIGINT,
    user_code_hour_view_pos_ntile_30d BIGINT,
    user_code_hour_view_neg_ntile_30d BIGINT,
    user_code_hour_view_pos_gauss_rank_1d DOUBLE,
    user_code_hour_view_neg_gauss_rank_1d DOUBLE,
    user_code_hour_view_pos_gauss_rank_3d DOUBLE,
    user_code_hour_view_neg_gauss_rank_3d DOUBLE,
    user_code_hour_view_pos_gauss_rank_7d DOUBLE,
    user_code_hour_view_neg_gauss_rank_7d DOUBLE,
    user_code_hour_view_pos_gauss_rank_30d DOUBLE,
    user_code_hour_view_neg_gauss_rank_30d DOUBLE,
    user_code_hour_view_woe_1d DOUBLE,
    user_code_hour_view_woe_3d DOUBLE,
    user_code_hour_view_woe_7d DOUBLE,
    user_code_hour_view_woe_30d DOUBLE,
    user_code_hour_view_odds_1d DOUBLE,
    user_code_hour_view_odds_3d DOUBLE,
    user_code_hour_view_odds_7d DOUBLE,
    user_code_hour_view_odds_30d DOUBLE,
    user_code_hour_view_odds_ratio_1d DOUBLE,
    user_code_hour_view_odds_ratio_3d DOUBLE,
    user_code_hour_view_odds_ratio_7d DOUBLE,
    user_code_hour_view_odds_ratio_30d DOUBLE,
    user_code_hour_cart_pos_ntile_1d BIGINT,
    user_code_hour_cart_neg_ntile_1d BIGINT,
    user_code_hour_cart_pos_ntile_3d BIGINT,
    user_code_hour_cart_neg_ntile_3d BIGINT,
    user_code_hour_cart_pos_ntile_7d BIGINT,
    user_code_hour_cart_neg_ntile_7d BIGINT,
    user_code_hour_cart_pos_ntile_30d BIGINT,
    user_code_hour_cart_neg_ntile_30d BIGINT,
    user_code_hour_cart_pos_gauss_rank_1d DOUBLE,
    user_code_hour_cart_neg_gauss_rank_1d DOUBLE,
    user_code_hour_cart_pos_gauss_rank_3d DOUBLE,
    user_code_hour_cart_neg_gauss_rank_3d DOUBLE,
    user_code_hour_cart_pos_gauss_rank_7d DOUBLE,
    user_code_hour_cart_neg_gauss_rank_7d DOUBLE,
    user_code_hour_cart_pos_gauss_rank_30d DOUBLE,
    user_code_hour_cart_neg_gauss_rank_30d DOUBLE,
    user_code_hour_cart_woe_1d DOUBLE,
    user_code_hour_cart_woe_3d DOUBLE,
    user_code_hour_cart_woe_7d DOUBLE,
    user_code_hour_cart_woe_30d DOUBLE,
    user_code_hour_cart_odds_1d DOUBLE,
    user_code_hour_cart_odds_3d DOUBLE,
    user_code_hour_cart_odds_7d DOUBLE,
    user_code_hour_cart_odds_30d DOUBLE,
    user_code_hour_cart_odds_ratio_1d DOUBLE,
    user_code_hour_cart_odds_ratio_3d DOUBLE,
    user_code_hour_cart_odds_ratio_7d DOUBLE,
    user_code_hour_cart_odds_ratio_30d DOUBLE,
    user_code_hour_purchase_gauss_rank_1d DOUBLE,
    user_code_hour_purchase_gauss_rank_3d DOUBLE,
    user_code_hour_purchase_gauss_rank_7d DOUBLE,
    user_code_hour_purchase_gauss_rank_30d DOUBLE,
    user_cate_price_level_view_pos_ntile_1d BIGINT,
    user_cate_price_level_view_neg_ntile_1d BIGINT,
    user_cate_price_level_view_pos_ntile_3d BIGINT,
    user_cate_price_level_view_neg_ntile_3d BIGINT,
    user_cate_price_level_view_pos_ntile_7d BIGINT,
    user_cate_price_level_view_neg_ntile_7d BIGINT,
    user_cate_price_level_view_pos_ntile_30d BIGINT,
    user_cate_price_level_view_neg_ntile_30d BIGINT,
    user_cate_price_level_view_pos_gauss_rank_1d DOUBLE,
    user_cate_price_level_view_neg_gauss_rank_1d DOUBLE,
    user_cate_price_level_view_pos_gauss_rank_3d DOUBLE,
    user_cate_price_level_view_neg_gauss_rank_3d DOUBLE,
    user_cate_price_level_view_pos_gauss_rank_7d DOUBLE,
    user_cate_price_level_view_neg_gauss_rank_7d DOUBLE,
    user_cate_price_level_view_pos_gauss_rank_30d DOUBLE,
    user_cate_price_level_view_neg_gauss_rank_30d DOUBLE,
    user_cate_price_level_view_woe_1d DOUBLE,
    user_cate_price_level_view_woe_3d DOUBLE,
    user_cate_price_level_view_woe_7d DOUBLE,
    user_cate_price_level_view_woe_30d DOUBLE,
    user_cate_price_level_view_odds_1d DOUBLE,
    user_cate_price_level_view_odds_3d DOUBLE,
    user_cate_price_level_view_odds_7d DOUBLE,
    user_cate_price_level_view_odds_30d DOUBLE,
    user_cate_price_level_view_odds_ratio_1d DOUBLE,
    user_cate_price_level_view_odds_ratio_3d DOUBLE,
    user_cate_price_level_view_odds_ratio_7d DOUBLE,
    user_cate_price_level_view_odds_ratio_30d DOUBLE,
    user_cate_price_level_cart_pos_ntile_1d BIGINT,
    user_cate_price_level_cart_neg_ntile_1d BIGINT,
    user_cate_price_level_cart_pos_ntile_3d BIGINT,
    user_cate_price_level_cart_neg_ntile_3d BIGINT,
    user_cate_price_level_cart_pos_ntile_7d BIGINT,
    user_cate_price_level_cart_neg_ntile_7d BIGINT,
    user_cate_price_level_cart_pos_ntile_30d BIGINT,
    user_cate_price_level_cart_neg_ntile_30d BIGINT,
    user_cate_price_level_cart_pos_gauss_rank_1d DOUBLE,
    user_cate_price_level_cart_neg_gauss_rank_1d DOUBLE,
    user_cate_price_level_cart_pos_gauss_rank_3d DOUBLE,
    user_cate_price_level_cart_neg_gauss_rank_3d DOUBLE,
    user_cate_price_level_cart_pos_gauss_rank_7d DOUBLE,
    user_cate_price_level_cart_neg_gauss_rank_7d DOUBLE,
    user_cate_price_level_cart_pos_gauss_rank_30d DOUBLE,
    user_cate_price_level_cart_neg_gauss_rank_30d DOUBLE,
    user_cate_price_level_cart_woe_1d DOUBLE,
    user_cate_price_level_cart_woe_3d DOUBLE,
    user_cate_price_level_cart_woe_7d DOUBLE,
    user_cate_price_level_cart_woe_30d DOUBLE,
    user_cate_price_level_cart_odds_1d DOUBLE,
    user_cate_price_level_cart_odds_3d DOUBLE,
    user_cate_price_level_cart_odds_7d DOUBLE,
    user_cate_price_level_cart_odds_30d DOUBLE,
    user_cate_price_level_cart_odds_ratio_1d DOUBLE,
    user_cate_price_level_cart_odds_ratio_3d DOUBLE,
    user_cate_price_level_cart_odds_ratio_7d DOUBLE,
    user_cate_price_level_cart_odds_ratio_30d DOUBLE,
    user_cate_price_level_purchase_gauss_rank_1d DOUBLE,
    user_cate_price_level_purchase_gauss_rank_3d DOUBLE,
    user_cate_price_level_purchase_gauss_rank_7d DOUBLE,
    user_cate_price_level_purchase_gauss_rank_30d DOUBLE
)
COMMENT '用户特征&样本表'
PARTITIONED BY (dt STRING COMMENT 'yyyymmdd')
;

INSERT OVERWRITE TABLE ecommerce_user_sample_v2 PARTITION(dt)
SELECT
    is_purchased, A.product_id, A.user_id, user_session, ts_weekday, A.hour_bin, ts_weekday*5+hour_bin as weekday_hour,
    A.product_idx, A.category_idx, A.brand_idx, A.cat_0_idx, A.cat_1_idx, A.cat_2_idx, A.code_idx, A.price_level,
    activity_count / max_activity_count as norm_activity_count, price, norm_price,
    A1.`(user_id|field_idx|dt|field|event_type)?+.+`,
    A2.`(user_id|field_idx|dt|field|event_type)?+.+`,
    A3.`(user_id|field_idx|dt|field)?+.+`,
    B1.`(user_id|field_idx|dt|field|event_type)?+.+`,
    B2.`(user_id|field_idx|dt|field|event_type)?+.+`,
    B3.`(user_id|field_idx|dt|field)?+.+`,
    C1.`(user_id|field_idx|dt|field|event_type)?+.+`,
    C2.`(user_id|field_idx|dt|field|event_type)?+.+`,
    C3.`(user_id|field_idx|dt|field)?+.+`,
    D1.`(user_id|field_idx|dt|field|event_type)?+.+`,
    D2.`(user_id|field_idx|dt|field|event_type)?+.+`,
    D3.`(user_id|field_idx|dt|field)?+.+`,
    E1.`(user_id|field_idx|dt|field|event_type)?+.+`,
    E2.`(user_id|field_idx|dt|field|event_type)?+.+`,
    E3.`(user_id|field_idx|dt|field)?+.+`,
    F1.`(user_id|field_idx|dt|field|event_type)?+.+`,
    F2.`(user_id|field_idx|dt|field|event_type)?+.+`,
    F3.`(user_id|field_idx|dt|field)?+.+`,
    G1.`(user_id|field_idx|dt|field|event_type)?+.+`,
    G2.`(user_id|field_idx|dt|field|event_type)?+.+`,
    G3.`(user_id|field_idx|dt|field)?+.+`,
    H1.`(user_id|field_idx|dt|field|event_type)?+.+`,
    H2.`(user_id|field_idx|dt|field|event_type)?+.+`,
    H3.`(user_id|field_idx|dt|field)?+.+`,
    I1.`(user_id|field_idx|dt|field|event_type)?+.+`,
    I2.`(user_id|field_idx|dt|field|event_type)?+.+`,
    I3.`(user_id|field_idx|dt|field)?+.+`,
    J1.`(user_id|field_idx|dt|field|event_type)?+.+`,
    J2.`(user_id|field_idx|dt|field|event_type)?+.+`,
    J3.`(user_id|field_idx|dt|field)?+.+`,
    A.dt
FROM (
  SELECT `(rn|weekday_hour)?+.+`, TO_CHAR(DATEADD(TO_DATE(dt, 'yyyymmdd'), -1, 'dd'), 'yyyymmdd') pre_day
  FROM (
    SELECT *, MAX(activity_count) OVER(PARTITION BY dt) max_activity_count,
        ROW_NUMBER() OVER(PARTITION BY dt, user_session, user_id, product_id order BY event_type) rn
    FROM ecommerce_behavior_wide_table
    WHERE dt >= '20191101' AND event_type IN ('cart', 'purchase')
  ) WHERE rn=1
) A
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='product' AND event_type='view'
) A1
ON A1.dt=A.pre_day AND A.user_id = A1.user_id AND A.product_idx=A1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='product' AND event_type='cart'
) A2
ON A2.dt=A.pre_day AND A.user_id = A2.user_id AND A.product_idx=A2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_purchase_gauss_rank
    WHERE dt >= '20191031' AND field='product'
) A3
ON A3.dt=A.pre_day AND A.user_id = A3.user_id AND A.price_level=A3.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='price_level' AND event_type='view'
) B1
ON B1.dt=A.pre_day AND A.user_id = B1.user_id AND A.price_level=B1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='price_level' AND event_type='cart'
) B2
ON B2.dt=A.pre_day AND A.user_id = B2.user_id AND A.price_level=B2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_purchase_gauss_rank
    WHERE dt >= '20191031' AND field='price_level'
) B3
ON B3.dt=A.pre_day AND A.user_id = B3.user_id AND A.price_level=B3.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='category' AND event_type='view'
) C1
ON C1.dt=A.pre_day AND A.user_id = C1.user_id AND A.category_idx=C1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='category' AND event_type='cart'
) C2
ON C2.dt=A.pre_day AND A.user_id = C2.user_id AND A.category_idx=C2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_purchase_gauss_rank
    WHERE dt >= '20191031' AND field='category'
) C3
ON C3.dt=A.pre_day AND A.user_id = C3.user_id AND A.category_idx=C3.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='cat_0' AND event_type='view'
) D1
ON D1.dt=A.pre_day AND A.user_id = D1.user_id AND A.cat_0_idx=D1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='cat_0' AND event_type='cart'
) D2
ON D2.dt=A.pre_day AND A.user_id = D2.user_id AND A.cat_0_idx=D2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_purchase_gauss_rank
    WHERE dt >= '20191031' AND field='cat_0'
) D3
ON D3.dt=A.pre_day AND A.user_id = D3.user_id AND A.cat_0_idx=D3.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='cat_1' AND event_type='view'
) E1
ON E1.dt=A.pre_day AND A.user_id = E1.user_id AND A.cat_1_idx=E1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='cat_1' AND event_type='cart'
) E2
ON E2.dt=A.pre_day AND A.user_id = E2.user_id AND A.cat_1_idx=E2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_purchase_gauss_rank
    WHERE dt >= '20191031' AND field='cat_1'
) E3
ON E3.dt=A.pre_day AND A.user_id = E3.user_id AND A.cat_1_idx=E3.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='cat_2' AND event_type='view'
) F1
ON F1.dt=A.pre_day AND A.user_id = F1.user_id AND A.cat_2_idx=F1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='cat_2' AND event_type='cart'
) F2
ON F2.dt=A.pre_day AND A.user_id = F2.user_id AND A.cat_2_idx=F2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_purchase_gauss_rank
    WHERE dt >= '20191031' AND field='cat_2'
) F3
ON F3.dt=A.pre_day AND A.user_id = F3.user_id AND A.cat_2_idx=F3.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='brand' AND event_type='view'
) G1
ON G1.dt=A.pre_day AND A.user_id = G1.user_id AND A.brand_idx=G1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='brand' AND event_type='cart'
) G2
ON G2.dt=A.pre_day AND A.user_id = G2.user_id AND A.brand_idx=G2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_purchase_gauss_rank
    WHERE dt >= '20191031' AND field='brand'
) G3
ON G3.dt=A.pre_day AND A.user_id = G3.user_id AND A.brand_idx=G3.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='code' AND event_type='view'
) H1
ON H1.dt=A.pre_day AND A.user_id = H1.user_id AND A.code_idx=H1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='code' AND event_type='cart'
) H2
ON H2.dt=A.pre_day AND A.user_id = H2.user_id AND A.code_idx=H2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_purchase_gauss_rank
    WHERE dt >= '20191031' AND field='code'
) H3
ON H3.dt=A.pre_day AND A.user_id = H3.user_id AND A.code_idx=H3.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='code_hour' AND event_type='view'
) I1
ON I1.dt=A.pre_day AND A.user_id = I1.user_id AND A.code_idx*5+A.hour_bin=I1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='code_hour' AND event_type='cart'
) I2
ON I2.dt=A.pre_day AND A.user_id = I2.user_id AND A.code_idx*5+A.hour_bin=I2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_purchase_gauss_rank
    WHERE dt >= '20191031' AND field='code_hour'
) I3
ON I3.dt=A.pre_day AND A.user_id = I3.user_id AND A.code_idx*5+A.hour_bin=I3.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='cate_price_level' AND event_type='view'
) J1
ON J1.dt=A.pre_day AND A.user_id = J1.user_id AND A.category_idx*10+A.price_level=J1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_bin_count_v2
    WHERE dt >= '20191031' AND field='cate_price_level' AND event_type='cart'
) J2
ON J2.dt=A.pre_day AND A.user_id = J2.user_id AND A.category_idx*10+A.price_level=J2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_user_purchase_gauss_rank
    WHERE dt >= '20191031' AND field='cate_price_level'
) J3
ON J3.dt=A.pre_day AND A.user_id = J3.user_id AND A.category_idx*10+A.price_level=J3.field_idx
;
