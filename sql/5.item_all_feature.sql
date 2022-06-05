CREATE TABLE IF NOT EXISTS ecommerce_item_all_feature
(
    product_id    BIGINT,
    item_view_pos_ntile_1d BIGINT,
    item_view_neg_ntile_1d BIGINT,
    item_view_pos_ntile_3d BIGINT,
    item_view_neg_ntile_3d BIGINT,
    item_view_pos_ntile_7d BIGINT,
    item_view_neg_ntile_7d BIGINT,
    item_view_pos_ntile_30d BIGINT,
    item_view_neg_ntile_30d BIGINT,
    item_view_pos_gauss_rank_1d DOUBLE,
    item_view_neg_gauss_rank_1d DOUBLE,
    item_view_pos_gauss_rank_3d DOUBLE,
    item_view_neg_gauss_rank_3d DOUBLE,
    item_view_pos_gauss_rank_7d DOUBLE,
    item_view_neg_gauss_rank_7d DOUBLE,
    item_view_pos_gauss_rank_30d DOUBLE,
    item_view_neg_gauss_rank_30d DOUBLE,
    item_cart_pos_ntile_1d BIGINT,
    item_cart_neg_ntile_1d BIGINT,
    item_cart_pos_ntile_3d BIGINT,
    item_cart_neg_ntile_3d BIGINT,
    item_cart_pos_ntile_7d BIGINT,
    item_cart_neg_ntile_7d BIGINT,
    item_cart_pos_ntile_30d BIGINT,
    item_cart_neg_ntile_30d BIGINT,
    item_cart_pos_gauss_rank_1d DOUBLE,
    item_cart_neg_gauss_rank_1d DOUBLE,
    item_cart_pos_gauss_rank_3d DOUBLE,
    item_cart_neg_gauss_rank_3d DOUBLE,
    item_cart_pos_gauss_rank_7d DOUBLE,
    item_cart_neg_gauss_rank_7d DOUBLE,
    item_cart_pos_gauss_rank_30d DOUBLE,
    item_cart_neg_gauss_rank_30d DOUBLE,
    item_purchase_pos_ntile_1d BIGINT,
    item_purchase_neg_ntile_1d BIGINT,
    item_purchase_pos_ntile_3d BIGINT,
    item_purchase_neg_ntile_3d BIGINT,
    item_purchase_pos_ntile_7d BIGINT,
    item_purchase_neg_ntile_7d BIGINT,
    item_purchase_pos_ntile_30d BIGINT,
    item_purchase_neg_ntile_30d BIGINT,
    item_purchase_pos_gauss_rank_1d DOUBLE,
    item_purchase_neg_gauss_rank_1d DOUBLE,
    item_purchase_pos_gauss_rank_3d DOUBLE,
    item_purchase_neg_gauss_rank_3d DOUBLE,
    item_purchase_pos_gauss_rank_7d DOUBLE,
    item_purchase_neg_gauss_rank_7d DOUBLE,
    item_purchase_pos_gauss_rank_30d DOUBLE,
    item_purchase_neg_gauss_rank_30d DOUBLE,
    item_view_te_1d DOUBLE,
    item_view_te_3d DOUBLE,
    item_view_te_7d DOUBLE,
    item_view_te_30d DOUBLE,
    item_cart_te_1d DOUBLE,
    item_cart_te_3d DOUBLE,
    item_cart_te_7d DOUBLE,
    item_cart_te_30d DOUBLE,
    code_view_pos_ntile_1d BIGINT,
    code_view_neg_ntile_1d BIGINT,
    code_view_pos_ntile_3d BIGINT,
    code_view_neg_ntile_3d BIGINT,
    code_view_pos_ntile_7d BIGINT,
    code_view_neg_ntile_7d BIGINT,
    code_view_pos_ntile_30d BIGINT,
    code_view_neg_ntile_30d BIGINT,
    code_view_pos_gauss_rank_1d DOUBLE,
    code_view_neg_gauss_rank_1d DOUBLE,
    code_view_pos_gauss_rank_3d DOUBLE,
    code_view_neg_gauss_rank_3d DOUBLE,
    code_view_pos_gauss_rank_7d DOUBLE,
    code_view_neg_gauss_rank_7d DOUBLE,
    code_view_pos_gauss_rank_30d DOUBLE,
    code_view_neg_gauss_rank_30d DOUBLE,
    code_view_woe_1d DOUBLE,
    code_view_woe_3d DOUBLE,
    code_view_woe_7d DOUBLE,
    code_view_woe_30d DOUBLE,
    code_view_info_value_1d DOUBLE,
    code_view_info_value_3d DOUBLE,
    code_view_info_value_7d DOUBLE,
    code_view_info_value_30d DOUBLE,
    code_view_odds_ratio_1d DOUBLE,
    code_view_odds_ratio_3d DOUBLE,
    code_view_odds_ratio_7d DOUBLE,
    code_view_odds_ratio_30d DOUBLE,
    code_view_chi_square_1d DOUBLE,
    code_view_chi_square_3d DOUBLE,
    code_view_chi_square_7d DOUBLE,
    code_view_chi_square_30d DOUBLE,
    code_view_gini_1d DOUBLE,
    code_view_gini_3d DOUBLE,
    code_view_gini_7d DOUBLE,
    code_view_gini_30d DOUBLE,
    code_cart_pos_ntile_1d BIGINT,
    code_cart_neg_ntile_1d BIGINT,
    code_cart_pos_ntile_3d BIGINT,
    code_cart_neg_ntile_3d BIGINT,
    code_cart_pos_ntile_7d BIGINT,
    code_cart_neg_ntile_7d BIGINT,
    code_cart_pos_ntile_30d BIGINT,
    code_cart_neg_ntile_30d BIGINT,
    code_cart_pos_gauss_rank_1d DOUBLE,
    code_cart_neg_gauss_rank_1d DOUBLE,
    code_cart_pos_gauss_rank_3d DOUBLE,
    code_cart_neg_gauss_rank_3d DOUBLE,
    code_cart_pos_gauss_rank_7d DOUBLE,
    code_cart_neg_gauss_rank_7d DOUBLE,
    code_cart_pos_gauss_rank_30d DOUBLE,
    code_cart_neg_gauss_rank_30d DOUBLE,
    code_cart_woe_1d DOUBLE,
    code_cart_woe_3d DOUBLE,
    code_cart_woe_7d DOUBLE,
    code_cart_woe_30d DOUBLE,
    code_cart_info_value_1d DOUBLE,
    code_cart_info_value_3d DOUBLE,
    code_cart_info_value_7d DOUBLE,
    code_cart_info_value_30d DOUBLE,
    code_cart_odds_ratio_1d DOUBLE,
    code_cart_odds_ratio_3d DOUBLE,
    code_cart_odds_ratio_7d DOUBLE,
    code_cart_odds_ratio_30d DOUBLE,
    code_cart_chi_square_1d DOUBLE,
    code_cart_chi_square_3d DOUBLE,
    code_cart_chi_square_7d DOUBLE,
    code_cart_chi_square_30d DOUBLE,
    code_cart_gini_1d DOUBLE,
    code_cart_gini_3d DOUBLE,
    code_cart_gini_7d DOUBLE,
    code_cart_gini_30d DOUBLE,
    category_view_pos_ntile_1d BIGINT,
    category_view_neg_ntile_1d BIGINT,
    category_view_pos_ntile_3d BIGINT,
    category_view_neg_ntile_3d BIGINT,
    category_view_pos_ntile_7d BIGINT,
    category_view_neg_ntile_7d BIGINT,
    category_view_pos_ntile_30d BIGINT,
    category_view_neg_ntile_30d BIGINT,
    category_view_pos_gauss_rank_1d DOUBLE,
    category_view_neg_gauss_rank_1d DOUBLE,
    category_view_pos_gauss_rank_3d DOUBLE,
    category_view_neg_gauss_rank_3d DOUBLE,
    category_view_pos_gauss_rank_7d DOUBLE,
    category_view_neg_gauss_rank_7d DOUBLE,
    category_view_pos_gauss_rank_30d DOUBLE,
    category_view_neg_gauss_rank_30d DOUBLE,
    category_view_woe_1d DOUBLE,
    category_view_woe_3d DOUBLE,
    category_view_woe_7d DOUBLE,
    category_view_woe_30d DOUBLE,
    category_view_info_value_1d DOUBLE,
    category_view_info_value_3d DOUBLE,
    category_view_info_value_7d DOUBLE,
    category_view_info_value_30d DOUBLE,
    category_view_odds_ratio_1d DOUBLE,
    category_view_odds_ratio_3d DOUBLE,
    category_view_odds_ratio_7d DOUBLE,
    category_view_odds_ratio_30d DOUBLE,
    category_view_chi_square_1d DOUBLE,
    category_view_chi_square_3d DOUBLE,
    category_view_chi_square_7d DOUBLE,
    category_view_chi_square_30d DOUBLE,
    category_view_gini_1d DOUBLE,
    category_view_gini_3d DOUBLE,
    category_view_gini_7d DOUBLE,
    category_view_gini_30d DOUBLE,
    category_cart_pos_ntile_1d BIGINT,
    category_cart_neg_ntile_1d BIGINT,
    category_cart_pos_ntile_3d BIGINT,
    category_cart_neg_ntile_3d BIGINT,
    category_cart_pos_ntile_7d BIGINT,
    category_cart_neg_ntile_7d BIGINT,
    category_cart_pos_ntile_30d BIGINT,
    category_cart_neg_ntile_30d BIGINT,
    category_cart_pos_gauss_rank_1d DOUBLE,
    category_cart_neg_gauss_rank_1d DOUBLE,
    category_cart_pos_gauss_rank_3d DOUBLE,
    category_cart_neg_gauss_rank_3d DOUBLE,
    category_cart_pos_gauss_rank_7d DOUBLE,
    category_cart_neg_gauss_rank_7d DOUBLE,
    category_cart_pos_gauss_rank_30d DOUBLE,
    category_cart_neg_gauss_rank_30d DOUBLE,
    category_cart_woe_1d DOUBLE,
    category_cart_woe_3d DOUBLE,
    category_cart_woe_7d DOUBLE,
    category_cart_woe_30d DOUBLE,
    category_cart_info_value_1d DOUBLE,
    category_cart_info_value_3d DOUBLE,
    category_cart_info_value_7d DOUBLE,
    category_cart_info_value_30d DOUBLE,
    category_cart_odds_ratio_1d DOUBLE,
    category_cart_odds_ratio_3d DOUBLE,
    category_cart_odds_ratio_7d DOUBLE,
    category_cart_odds_ratio_30d DOUBLE,
    category_cart_chi_square_1d DOUBLE,
    category_cart_chi_square_3d DOUBLE,
    category_cart_chi_square_7d DOUBLE,
    category_cart_chi_square_30d DOUBLE,
    category_cart_gini_1d DOUBLE,
    category_cart_gini_3d DOUBLE,
    category_cart_gini_7d DOUBLE,
    category_cart_gini_30d DOUBLE,
    cat_0_view_pos_ntile_1d BIGINT,
    cat_0_view_neg_ntile_1d BIGINT,
    cat_0_view_pos_ntile_3d BIGINT,
    cat_0_view_neg_ntile_3d BIGINT,
    cat_0_view_pos_ntile_7d BIGINT,
    cat_0_view_neg_ntile_7d BIGINT,
    cat_0_view_pos_ntile_30d BIGINT,
    cat_0_view_neg_ntile_30d BIGINT,
    cat_0_view_pos_gauss_rank_1d DOUBLE,
    cat_0_view_neg_gauss_rank_1d DOUBLE,
    cat_0_view_pos_gauss_rank_3d DOUBLE,
    cat_0_view_neg_gauss_rank_3d DOUBLE,
    cat_0_view_pos_gauss_rank_7d DOUBLE,
    cat_0_view_neg_gauss_rank_7d DOUBLE,
    cat_0_view_pos_gauss_rank_30d DOUBLE,
    cat_0_view_neg_gauss_rank_30d DOUBLE,
    cat_0_view_woe_1d DOUBLE,
    cat_0_view_woe_3d DOUBLE,
    cat_0_view_woe_7d DOUBLE,
    cat_0_view_woe_30d DOUBLE,
    cat_0_view_info_value_1d DOUBLE,
    cat_0_view_info_value_3d DOUBLE,
    cat_0_view_info_value_7d DOUBLE,
    cat_0_view_info_value_30d DOUBLE,
    cat_0_view_odds_ratio_1d DOUBLE,
    cat_0_view_odds_ratio_3d DOUBLE,
    cat_0_view_odds_ratio_7d DOUBLE,
    cat_0_view_odds_ratio_30d DOUBLE,
    cat_0_view_chi_square_1d DOUBLE,
    cat_0_view_chi_square_3d DOUBLE,
    cat_0_view_chi_square_7d DOUBLE,
    cat_0_view_chi_square_30d DOUBLE,
    cat_0_view_gini_1d DOUBLE,
    cat_0_view_gini_3d DOUBLE,
    cat_0_view_gini_7d DOUBLE,
    cat_0_view_gini_30d DOUBLE,
    cat_0_cart_pos_ntile_1d BIGINT,
    cat_0_cart_neg_ntile_1d BIGINT,
    cat_0_cart_pos_ntile_3d BIGINT,
    cat_0_cart_neg_ntile_3d BIGINT,
    cat_0_cart_pos_ntile_7d BIGINT,
    cat_0_cart_neg_ntile_7d BIGINT,
    cat_0_cart_pos_ntile_30d BIGINT,
    cat_0_cart_neg_ntile_30d BIGINT,
    cat_0_cart_pos_gauss_rank_1d DOUBLE,
    cat_0_cart_neg_gauss_rank_1d DOUBLE,
    cat_0_cart_pos_gauss_rank_3d DOUBLE,
    cat_0_cart_neg_gauss_rank_3d DOUBLE,
    cat_0_cart_pos_gauss_rank_7d DOUBLE,
    cat_0_cart_neg_gauss_rank_7d DOUBLE,
    cat_0_cart_pos_gauss_rank_30d DOUBLE,
    cat_0_cart_neg_gauss_rank_30d DOUBLE,
    cat_0_cart_woe_1d DOUBLE,
    cat_0_cart_woe_3d DOUBLE,
    cat_0_cart_woe_7d DOUBLE,
    cat_0_cart_woe_30d DOUBLE,
    cat_0_cart_info_value_1d DOUBLE,
    cat_0_cart_info_value_3d DOUBLE,
    cat_0_cart_info_value_7d DOUBLE,
    cat_0_cart_info_value_30d DOUBLE,
    cat_0_cart_odds_ratio_1d DOUBLE,
    cat_0_cart_odds_ratio_3d DOUBLE,
    cat_0_cart_odds_ratio_7d DOUBLE,
    cat_0_cart_odds_ratio_30d DOUBLE,
    cat_0_cart_chi_square_1d DOUBLE,
    cat_0_cart_chi_square_3d DOUBLE,
    cat_0_cart_chi_square_7d DOUBLE,
    cat_0_cart_chi_square_30d DOUBLE,
    cat_0_cart_gini_1d DOUBLE,
    cat_0_cart_gini_3d DOUBLE,
    cat_0_cart_gini_7d DOUBLE,
    cat_0_cart_gini_30d DOUBLE,
    cat_1_view_pos_ntile_1d BIGINT,
    cat_1_view_neg_ntile_1d BIGINT,
    cat_1_view_pos_ntile_3d BIGINT,
    cat_1_view_neg_ntile_3d BIGINT,
    cat_1_view_pos_ntile_7d BIGINT,
    cat_1_view_neg_ntile_7d BIGINT,
    cat_1_view_pos_ntile_30d BIGINT,
    cat_1_view_neg_ntile_30d BIGINT,
    cat_1_view_pos_gauss_rank_1d DOUBLE,
    cat_1_view_neg_gauss_rank_1d DOUBLE,
    cat_1_view_pos_gauss_rank_3d DOUBLE,
    cat_1_view_neg_gauss_rank_3d DOUBLE,
    cat_1_view_pos_gauss_rank_7d DOUBLE,
    cat_1_view_neg_gauss_rank_7d DOUBLE,
    cat_1_view_pos_gauss_rank_30d DOUBLE,
    cat_1_view_neg_gauss_rank_30d DOUBLE,
    cat_1_view_woe_1d DOUBLE,
    cat_1_view_woe_3d DOUBLE,
    cat_1_view_woe_7d DOUBLE,
    cat_1_view_woe_30d DOUBLE,
    cat_1_view_info_value_1d DOUBLE,
    cat_1_view_info_value_3d DOUBLE,
    cat_1_view_info_value_7d DOUBLE,
    cat_1_view_info_value_30d DOUBLE,
    cat_1_view_odds_ratio_1d DOUBLE,
    cat_1_view_odds_ratio_3d DOUBLE,
    cat_1_view_odds_ratio_7d DOUBLE,
    cat_1_view_odds_ratio_30d DOUBLE,
    cat_1_view_chi_square_1d DOUBLE,
    cat_1_view_chi_square_3d DOUBLE,
    cat_1_view_chi_square_7d DOUBLE,
    cat_1_view_chi_square_30d DOUBLE,
    cat_1_view_gini_1d DOUBLE,
    cat_1_view_gini_3d DOUBLE,
    cat_1_view_gini_7d DOUBLE,
    cat_1_view_gini_30d DOUBLE,
    cat_1_cart_pos_ntile_1d BIGINT,
    cat_1_cart_neg_ntile_1d BIGINT,
    cat_1_cart_pos_ntile_3d BIGINT,
    cat_1_cart_neg_ntile_3d BIGINT,
    cat_1_cart_pos_ntile_7d BIGINT,
    cat_1_cart_neg_ntile_7d BIGINT,
    cat_1_cart_pos_ntile_30d BIGINT,
    cat_1_cart_neg_ntile_30d BIGINT,
    cat_1_cart_pos_gauss_rank_1d DOUBLE,
    cat_1_cart_neg_gauss_rank_1d DOUBLE,
    cat_1_cart_pos_gauss_rank_3d DOUBLE,
    cat_1_cart_neg_gauss_rank_3d DOUBLE,
    cat_1_cart_pos_gauss_rank_7d DOUBLE,
    cat_1_cart_neg_gauss_rank_7d DOUBLE,
    cat_1_cart_pos_gauss_rank_30d DOUBLE,
    cat_1_cart_neg_gauss_rank_30d DOUBLE,
    cat_1_cart_woe_1d DOUBLE,
    cat_1_cart_woe_3d DOUBLE,
    cat_1_cart_woe_7d DOUBLE,
    cat_1_cart_woe_30d DOUBLE,
    cat_1_cart_info_value_1d DOUBLE,
    cat_1_cart_info_value_3d DOUBLE,
    cat_1_cart_info_value_7d DOUBLE,
    cat_1_cart_info_value_30d DOUBLE,
    cat_1_cart_odds_ratio_1d DOUBLE,
    cat_1_cart_odds_ratio_3d DOUBLE,
    cat_1_cart_odds_ratio_7d DOUBLE,
    cat_1_cart_odds_ratio_30d DOUBLE,
    cat_1_cart_chi_square_1d DOUBLE,
    cat_1_cart_chi_square_3d DOUBLE,
    cat_1_cart_chi_square_7d DOUBLE,
    cat_1_cart_chi_square_30d DOUBLE,
    cat_1_cart_gini_1d DOUBLE,
    cat_1_cart_gini_3d DOUBLE,
    cat_1_cart_gini_7d DOUBLE,
    cat_1_cart_gini_30d DOUBLE,
    cat_2_view_pos_ntile_1d BIGINT,
    cat_2_view_neg_ntile_1d BIGINT,
    cat_2_view_pos_ntile_3d BIGINT,
    cat_2_view_neg_ntile_3d BIGINT,
    cat_2_view_pos_ntile_7d BIGINT,
    cat_2_view_neg_ntile_7d BIGINT,
    cat_2_view_pos_ntile_30d BIGINT,
    cat_2_view_neg_ntile_30d BIGINT,
    cat_2_view_pos_gauss_rank_1d DOUBLE,
    cat_2_view_neg_gauss_rank_1d DOUBLE,
    cat_2_view_pos_gauss_rank_3d DOUBLE,
    cat_2_view_neg_gauss_rank_3d DOUBLE,
    cat_2_view_pos_gauss_rank_7d DOUBLE,
    cat_2_view_neg_gauss_rank_7d DOUBLE,
    cat_2_view_pos_gauss_rank_30d DOUBLE,
    cat_2_view_neg_gauss_rank_30d DOUBLE,
    cat_2_view_woe_1d DOUBLE,
    cat_2_view_woe_3d DOUBLE,
    cat_2_view_woe_7d DOUBLE,
    cat_2_view_woe_30d DOUBLE,
    cat_2_view_info_value_1d DOUBLE,
    cat_2_view_info_value_3d DOUBLE,
    cat_2_view_info_value_7d DOUBLE,
    cat_2_view_info_value_30d DOUBLE,
    cat_2_view_odds_ratio_1d DOUBLE,
    cat_2_view_odds_ratio_3d DOUBLE,
    cat_2_view_odds_ratio_7d DOUBLE,
    cat_2_view_odds_ratio_30d DOUBLE,
    cat_2_view_chi_square_1d DOUBLE,
    cat_2_view_chi_square_3d DOUBLE,
    cat_2_view_chi_square_7d DOUBLE,
    cat_2_view_chi_square_30d DOUBLE,
    cat_2_view_gini_1d DOUBLE,
    cat_2_view_gini_3d DOUBLE,
    cat_2_view_gini_7d DOUBLE,
    cat_2_view_gini_30d DOUBLE,
    cat_2_cart_pos_ntile_1d BIGINT,
    cat_2_cart_neg_ntile_1d BIGINT,
    cat_2_cart_pos_ntile_3d BIGINT,
    cat_2_cart_neg_ntile_3d BIGINT,
    cat_2_cart_pos_ntile_7d BIGINT,
    cat_2_cart_neg_ntile_7d BIGINT,
    cat_2_cart_pos_ntile_30d BIGINT,
    cat_2_cart_neg_ntile_30d BIGINT,
    cat_2_cart_pos_gauss_rank_1d DOUBLE,
    cat_2_cart_neg_gauss_rank_1d DOUBLE,
    cat_2_cart_pos_gauss_rank_3d DOUBLE,
    cat_2_cart_neg_gauss_rank_3d DOUBLE,
    cat_2_cart_pos_gauss_rank_7d DOUBLE,
    cat_2_cart_neg_gauss_rank_7d DOUBLE,
    cat_2_cart_pos_gauss_rank_30d DOUBLE,
    cat_2_cart_neg_gauss_rank_30d DOUBLE,
    cat_2_cart_woe_1d DOUBLE,
    cat_2_cart_woe_3d DOUBLE,
    cat_2_cart_woe_7d DOUBLE,
    cat_2_cart_woe_30d DOUBLE,
    cat_2_cart_info_value_1d DOUBLE,
    cat_2_cart_info_value_3d DOUBLE,
    cat_2_cart_info_value_7d DOUBLE,
    cat_2_cart_info_value_30d DOUBLE,
    cat_2_cart_odds_ratio_1d DOUBLE,
    cat_2_cart_odds_ratio_3d DOUBLE,
    cat_2_cart_odds_ratio_7d DOUBLE,
    cat_2_cart_odds_ratio_30d DOUBLE,
    cat_2_cart_chi_square_1d DOUBLE,
    cat_2_cart_chi_square_3d DOUBLE,
    cat_2_cart_chi_square_7d DOUBLE,
    cat_2_cart_chi_square_30d DOUBLE,
    cat_2_cart_gini_1d DOUBLE,
    cat_2_cart_gini_3d DOUBLE,
    cat_2_cart_gini_7d DOUBLE,
    cat_2_cart_gini_30d DOUBLE,
    brand_view_pos_ntile_1d BIGINT,
    brand_view_neg_ntile_1d BIGINT,
    brand_view_pos_ntile_3d BIGINT,
    brand_view_neg_ntile_3d BIGINT,
    brand_view_pos_ntile_7d BIGINT,
    brand_view_neg_ntile_7d BIGINT,
    brand_view_pos_ntile_30d BIGINT,
    brand_view_neg_ntile_30d BIGINT,
    brand_view_pos_gauss_rank_1d DOUBLE,
    brand_view_neg_gauss_rank_1d DOUBLE,
    brand_view_pos_gauss_rank_3d DOUBLE,
    brand_view_neg_gauss_rank_3d DOUBLE,
    brand_view_pos_gauss_rank_7d DOUBLE,
    brand_view_neg_gauss_rank_7d DOUBLE,
    brand_view_pos_gauss_rank_30d DOUBLE,
    brand_view_neg_gauss_rank_30d DOUBLE,
    brand_view_woe_1d DOUBLE,
    brand_view_woe_3d DOUBLE,
    brand_view_woe_7d DOUBLE,
    brand_view_woe_30d DOUBLE,
    brand_view_info_value_1d DOUBLE,
    brand_view_info_value_3d DOUBLE,
    brand_view_info_value_7d DOUBLE,
    brand_view_info_value_30d DOUBLE,
    brand_view_odds_ratio_1d DOUBLE,
    brand_view_odds_ratio_3d DOUBLE,
    brand_view_odds_ratio_7d DOUBLE,
    brand_view_odds_ratio_30d DOUBLE,
    brand_view_chi_square_1d DOUBLE,
    brand_view_chi_square_3d DOUBLE,
    brand_view_chi_square_7d DOUBLE,
    brand_view_chi_square_30d DOUBLE,
    brand_view_gini_1d DOUBLE,
    brand_view_gini_3d DOUBLE,
    brand_view_gini_7d DOUBLE,
    brand_view_gini_30d DOUBLE,
    brand_cart_pos_ntile_1d BIGINT,
    brand_cart_neg_ntile_1d BIGINT,
    brand_cart_pos_ntile_3d BIGINT,
    brand_cart_neg_ntile_3d BIGINT,
    brand_cart_pos_ntile_7d BIGINT,
    brand_cart_neg_ntile_7d BIGINT,
    brand_cart_pos_ntile_30d BIGINT,
    brand_cart_neg_ntile_30d BIGINT,
    brand_cart_pos_gauss_rank_1d DOUBLE,
    brand_cart_neg_gauss_rank_1d DOUBLE,
    brand_cart_pos_gauss_rank_3d DOUBLE,
    brand_cart_neg_gauss_rank_3d DOUBLE,
    brand_cart_pos_gauss_rank_7d DOUBLE,
    brand_cart_neg_gauss_rank_7d DOUBLE,
    brand_cart_pos_gauss_rank_30d DOUBLE,
    brand_cart_neg_gauss_rank_30d DOUBLE,
    brand_cart_woe_1d DOUBLE,
    brand_cart_woe_3d DOUBLE,
    brand_cart_woe_7d DOUBLE,
    brand_cart_woe_30d DOUBLE,
    brand_cart_info_value_1d DOUBLE,
    brand_cart_info_value_3d DOUBLE,
    brand_cart_info_value_7d DOUBLE,
    brand_cart_info_value_30d DOUBLE,
    brand_cart_odds_ratio_1d DOUBLE,
    brand_cart_odds_ratio_3d DOUBLE,
    brand_cart_odds_ratio_7d DOUBLE,
    brand_cart_odds_ratio_30d DOUBLE,
    brand_cart_chi_square_1d DOUBLE,
    brand_cart_chi_square_3d DOUBLE,
    brand_cart_chi_square_7d DOUBLE,
    brand_cart_chi_square_30d DOUBLE,
    brand_cart_gini_1d DOUBLE,
    brand_cart_gini_3d DOUBLE,
    brand_cart_gini_7d DOUBLE,
    brand_cart_gini_30d DOUBLE,
    price_level_view_pos_ntile_1d BIGINT,
    price_level_view_neg_ntile_1d BIGINT,
    price_level_view_pos_ntile_3d BIGINT,
    price_level_view_neg_ntile_3d BIGINT,
    price_level_view_pos_ntile_7d BIGINT,
    price_level_view_neg_ntile_7d BIGINT,
    price_level_view_pos_ntile_30d BIGINT,
    price_level_view_neg_ntile_30d BIGINT,
    price_level_view_pos_gauss_rank_1d DOUBLE,
    price_level_view_neg_gauss_rank_1d DOUBLE,
    price_level_view_pos_gauss_rank_3d DOUBLE,
    price_level_view_neg_gauss_rank_3d DOUBLE,
    price_level_view_pos_gauss_rank_7d DOUBLE,
    price_level_view_neg_gauss_rank_7d DOUBLE,
    price_level_view_pos_gauss_rank_30d DOUBLE,
    price_level_view_neg_gauss_rank_30d DOUBLE,
    price_level_view_woe_1d DOUBLE,
    price_level_view_woe_3d DOUBLE,
    price_level_view_woe_7d DOUBLE,
    price_level_view_woe_30d DOUBLE,
    price_level_view_info_value_1d DOUBLE,
    price_level_view_info_value_3d DOUBLE,
    price_level_view_info_value_7d DOUBLE,
    price_level_view_info_value_30d DOUBLE,
    price_level_view_odds_ratio_1d DOUBLE,
    price_level_view_odds_ratio_3d DOUBLE,
    price_level_view_odds_ratio_7d DOUBLE,
    price_level_view_odds_ratio_30d DOUBLE,
    price_level_view_chi_square_1d DOUBLE,
    price_level_view_chi_square_3d DOUBLE,
    price_level_view_chi_square_7d DOUBLE,
    price_level_view_chi_square_30d DOUBLE,
    price_level_view_gini_1d DOUBLE,
    price_level_view_gini_3d DOUBLE,
    price_level_view_gini_7d DOUBLE,
    price_level_view_gini_30d DOUBLE,
    price_level_cart_pos_ntile_1d BIGINT,
    price_level_cart_neg_ntile_1d BIGINT,
    price_level_cart_pos_ntile_3d BIGINT,
    price_level_cart_neg_ntile_3d BIGINT,
    price_level_cart_pos_ntile_7d BIGINT,
    price_level_cart_neg_ntile_7d BIGINT,
    price_level_cart_pos_ntile_30d BIGINT,
    price_level_cart_neg_ntile_30d BIGINT,
    price_level_cart_pos_gauss_rank_1d DOUBLE,
    price_level_cart_neg_gauss_rank_1d DOUBLE,
    price_level_cart_pos_gauss_rank_3d DOUBLE,
    price_level_cart_neg_gauss_rank_3d DOUBLE,
    price_level_cart_pos_gauss_rank_7d DOUBLE,
    price_level_cart_neg_gauss_rank_7d DOUBLE,
    price_level_cart_pos_gauss_rank_30d DOUBLE,
    price_level_cart_neg_gauss_rank_30d DOUBLE,
    price_level_cart_woe_1d DOUBLE,
    price_level_cart_woe_3d DOUBLE,
    price_level_cart_woe_7d DOUBLE,
    price_level_cart_woe_30d DOUBLE,
    price_level_cart_info_value_1d DOUBLE,
    price_level_cart_info_value_3d DOUBLE,
    price_level_cart_info_value_7d DOUBLE,
    price_level_cart_info_value_30d DOUBLE,
    price_level_cart_odds_ratio_1d DOUBLE,
    price_level_cart_odds_ratio_3d DOUBLE,
    price_level_cart_odds_ratio_7d DOUBLE,
    price_level_cart_odds_ratio_30d DOUBLE,
    price_level_cart_chi_square_1d DOUBLE,
    price_level_cart_chi_square_3d DOUBLE,
    price_level_cart_chi_square_7d DOUBLE,
    price_level_cart_chi_square_30d DOUBLE,
    price_level_cart_gini_1d DOUBLE,
    price_level_cart_gini_3d DOUBLE,
    price_level_cart_gini_7d DOUBLE,
    price_level_cart_gini_30d DOUBLE,
    cate_price_level_view_pos_ntile_1d BIGINT,
    cate_price_level_view_neg_ntile_1d BIGINT,
    cate_price_level_view_pos_ntile_3d BIGINT,
    cate_price_level_view_neg_ntile_3d BIGINT,
    cate_price_level_view_pos_ntile_7d BIGINT,
    cate_price_level_view_neg_ntile_7d BIGINT,
    cate_price_level_view_pos_ntile_30d BIGINT,
    cate_price_level_view_neg_ntile_30d BIGINT,
    cate_price_level_view_pos_gauss_rank_1d DOUBLE,
    cate_price_level_view_neg_gauss_rank_1d DOUBLE,
    cate_price_level_view_pos_gauss_rank_3d DOUBLE,
    cate_price_level_view_neg_gauss_rank_3d DOUBLE,
    cate_price_level_view_pos_gauss_rank_7d DOUBLE,
    cate_price_level_view_neg_gauss_rank_7d DOUBLE,
    cate_price_level_view_pos_gauss_rank_30d DOUBLE,
    cate_price_level_view_neg_gauss_rank_30d DOUBLE,
    cate_price_level_view_woe_1d DOUBLE,
    cate_price_level_view_woe_3d DOUBLE,
    cate_price_level_view_woe_7d DOUBLE,
    cate_price_level_view_woe_30d DOUBLE,
    cate_price_level_view_info_value_1d DOUBLE,
    cate_price_level_view_info_value_3d DOUBLE,
    cate_price_level_view_info_value_7d DOUBLE,
    cate_price_level_view_info_value_30d DOUBLE,
    cate_price_level_view_odds_ratio_1d DOUBLE,
    cate_price_level_view_odds_ratio_3d DOUBLE,
    cate_price_level_view_odds_ratio_7d DOUBLE,
    cate_price_level_view_odds_ratio_30d DOUBLE,
    cate_price_level_view_chi_square_1d DOUBLE,
    cate_price_level_view_chi_square_3d DOUBLE,
    cate_price_level_view_chi_square_7d DOUBLE,
    cate_price_level_view_chi_square_30d DOUBLE,
    cate_price_level_view_gini_1d DOUBLE,
    cate_price_level_view_gini_3d DOUBLE,
    cate_price_level_view_gini_7d DOUBLE,
    cate_price_level_view_gini_30d DOUBLE,
    cate_price_level_cart_pos_ntile_1d BIGINT,
    cate_price_level_cart_neg_ntile_1d BIGINT,
    cate_price_level_cart_pos_ntile_3d BIGINT,
    cate_price_level_cart_neg_ntile_3d BIGINT,
    cate_price_level_cart_pos_ntile_7d BIGINT,
    cate_price_level_cart_neg_ntile_7d BIGINT,
    cate_price_level_cart_pos_ntile_30d BIGINT,
    cate_price_level_cart_neg_ntile_30d BIGINT,
    cate_price_level_cart_pos_gauss_rank_1d DOUBLE,
    cate_price_level_cart_neg_gauss_rank_1d DOUBLE,
    cate_price_level_cart_pos_gauss_rank_3d DOUBLE,
    cate_price_level_cart_neg_gauss_rank_3d DOUBLE,
    cate_price_level_cart_pos_gauss_rank_7d DOUBLE,
    cate_price_level_cart_neg_gauss_rank_7d DOUBLE,
    cate_price_level_cart_pos_gauss_rank_30d DOUBLE,
    cate_price_level_cart_neg_gauss_rank_30d DOUBLE,
    cate_price_level_cart_woe_1d DOUBLE,
    cate_price_level_cart_woe_3d DOUBLE,
    cate_price_level_cart_woe_7d DOUBLE,
    cate_price_level_cart_woe_30d DOUBLE,
    cate_price_level_cart_info_value_1d DOUBLE,
    cate_price_level_cart_info_value_3d DOUBLE,
    cate_price_level_cart_info_value_7d DOUBLE,
    cate_price_level_cart_info_value_30d DOUBLE,
    cate_price_level_cart_odds_ratio_1d DOUBLE,
    cate_price_level_cart_odds_ratio_3d DOUBLE,
    cate_price_level_cart_odds_ratio_7d DOUBLE,
    cate_price_level_cart_odds_ratio_30d DOUBLE,
    cate_price_level_cart_chi_square_1d DOUBLE,
    cate_price_level_cart_chi_square_3d DOUBLE,
    cate_price_level_cart_chi_square_7d DOUBLE,
    cate_price_level_cart_chi_square_30d DOUBLE,
    cate_price_level_cart_gini_1d DOUBLE,
    cate_price_level_cart_gini_3d DOUBLE,
    cate_price_level_cart_gini_7d DOUBLE,
    cate_price_level_cart_gini_30d DOUBLE
)
COMMENT 'item bin count features'
PARTITIONED BY (dt STRING COMMENT 'yyyymmdd')
;

INSERT OVERWRITE TABLE ecommerce_item_all_feature PARTITION(dt)
SELECT /*+MAPJOIN(B1,B2,C1,C2,D1,D2,E1,E2,F1,F2,H1,H2,GO1,GO2,CO1,CO2)*/
    A.product_id,
    IT1.`(product_idx|event_type|dt)?+.+`,
    IT2.`(product_idx|event_type|dt)?+.+`,
    IT3.`(product_idx|event_type|dt)?+.+`,
    (P1.pos_cnt_1d+20*NVL(CO1.prob_1d, GO1.global_prob_1d))/(P1.total_cnt_1d+20) as item_view_te_1d,
    (P1.pos_cnt_3d+20*NVL(CO1.prob_3d, GO1.global_prob_3d))/(P1.total_cnt_3d+20) as item_view_te_3d,
    (P1.pos_cnt_7d+20*NVL(CO1.prob_7d, GO1.global_prob_7d))/(P1.total_cnt_7d+20) as item_view_te_7d,
    (P1.pos_cnt_30d+20*NVL(CO1.prob_30d, GO1.global_prob_30d))/(P1.total_cnt_30d+20) as item_view_te_30d,
    (P2.pos_cnt_1d+20*NVL(CO2.prob_1d, GO2.global_prob_1d))/(P2.total_cnt_1d+20) as item_cart_te_1d,
    (P2.pos_cnt_3d+20*NVL(CO2.prob_3d, GO2.global_prob_3d))/(P2.total_cnt_3d+20) as item_cart_te_3d,
    (P2.pos_cnt_7d+20*NVL(CO2.prob_7d, GO2.global_prob_7d))/(P2.total_cnt_7d+20) as item_cart_te_7d,
    (P2.pos_cnt_30d+20*NVL(CO2.prob_30d, GO2.global_prob_30d))/(P2.total_cnt_30d+20) as item_cart_te_30d,
    B1.`(field_idx|dt|field|event_type)?+.+`,
    B2.`(field_idx|dt|field|event_type)?+.+`,
    C1.`(field_idx|dt|field|event_type)?+.+`,
    C2.`(field_idx|dt|field|event_type)?+.+`,
    D1.`(field_idx|dt|field|event_type)?+.+`,
    D2.`(field_idx|dt|field|event_type)?+.+`,
    E1.`(field_idx|dt|field|event_type)?+.+`,
    E2.`(field_idx|dt|field|event_type)?+.+`,
    F1.`(field_idx|dt|field|event_type)?+.+`,
    F2.`(field_idx|dt|field|event_type)?+.+`,
    G1.`(field_idx|dt|field|event_type)?+.+`,
    G2.`(field_idx|dt|field|event_type)?+.+`,
    H1.`(field_idx|dt|field|event_type)?+.+`,
    H2.`(field_idx|dt|field|event_type)?+.+`,
    I1.`(field_idx|dt|field|event_type)?+.+`,
    I2.`(field_idx|dt|field|event_type)?+.+`,
    A.dt
FROM (
    SELECT *
    FROM (
        SELECT product_id, product_idx, category_idx, code_idx, cat_0_idx, cat_1_idx,
            cat_2_idx, brand_idx, price_level, hour_bin, ts_weekday, weekday_hour,
            dt, ROW_NUMBER() OVER(PARTITION BY dt, product_id ORDER BY event_time DESC) rn
        FROM ecommerce_behavior_wide_table
        WHERE dt>='20191031'
    )
    WHERE rn=1
) A
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_count_feature
    WHERE dt>='20191031' AND event_type='view'
) IT1
ON A.dt=IT1.dt AND A.product_idx=IT1.product_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_count_feature
    WHERE dt>='20191031' AND event_type='cart'
) IT2
ON A.dt=IT2.dt AND A.product_idx=IT2.product_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_count_feature
    WHERE dt>='20191031' AND event_type='purchase'
) IT3
ON A.dt=IT3.dt AND A.product_idx=IT3.product_idx
LEFT JOIN (
    SELECT dt, sum(pos_cnt_1d)/sum(total_cnt_1d) global_prob_1d,
        sum(pos_cnt_3d)/sum(total_cnt_3d) global_prob_3d,
        sum(pos_cnt_7d)/sum(total_cnt_7d) global_prob_7d,
        sum(pos_cnt_30d)/sum(total_cnt_30d) global_prob_30d
    FROM ecommerce_item_cumulate_count
    WHERE dt>='20191031' AND field='product' AND event_type='view'
    GROUP BY dt
) GO1
ON A.dt=GO1.dt
LEFT JOIN (
    SELECT dt, sum(pos_cnt_1d)/sum(total_cnt_1d) global_prob_1d,
        sum(pos_cnt_3d)/sum(total_cnt_3d) global_prob_3d,
        sum(pos_cnt_7d)/sum(total_cnt_7d) global_prob_7d,
        sum(pos_cnt_30d)/sum(total_cnt_30d) global_prob_30d
    FROM ecommerce_item_cumulate_count
    WHERE dt>='20191031' AND field='product' AND event_type='cart'
    GROUP BY dt
) GO2
ON A.dt=GO2.dt
LEFT JOIN (
    SELECT dt, field_idx, pos_cnt_1d, total_cnt_1d, pos_cnt_3d, total_cnt_3d,
        pos_cnt_7d, total_cnt_7d, pos_cnt_30d, total_cnt_30d
    FROM ecommerce_item_cumulate_count
    WHERE dt>='20191031' AND field='product' AND event_type='view'
) P1
ON A.dt=P1.dt AND A.product_idx=P1.field_idx
LEFT JOIN (
    SELECT dt, field_idx, pos_cnt_1d, total_cnt_1d, pos_cnt_3d, total_cnt_3d,
        pos_cnt_7d, total_cnt_7d, pos_cnt_30d, total_cnt_30d
    FROM ecommerce_item_cumulate_count
    WHERE dt>='20191031' AND field='product' AND event_type='cart'
) P2
ON A.dt=P2.dt AND A.product_idx=P2.field_idx
LEFT JOIN (
    SELECT dt, field_idx, IF(total_cnt_1d=0, NULL, pos_cnt_1d/total_cnt_1d) as prob_1d,
        IF(total_cnt_3d=0, NULL, pos_cnt_3d/total_cnt_3d) as prob_3d,
        IF(total_cnt_7d=0, NULL, pos_cnt_7d/total_cnt_7d) as prob_7d,
        IF(total_cnt_30d=0, NULL, pos_cnt_30d/total_cnt_30d) as prob_30d
    FROM ecommerce_item_cumulate_count
    WHERE dt>='20191031' AND field='code' AND event_type='view'
) CO1
ON A.dt=CO1.dt AND A.code_idx=CO1.field_idx
LEFT JOIN (
    SELECT dt, field_idx, IF(total_cnt_1d=0, NULL, pos_cnt_1d/total_cnt_1d) as prob_1d,
        IF(total_cnt_3d=0, NULL, pos_cnt_3d/total_cnt_3d) as prob_3d,
        IF(total_cnt_7d=0, NULL, pos_cnt_7d/total_cnt_7d) as prob_7d,
        IF(total_cnt_30d=0, NULL, pos_cnt_30d/total_cnt_30d) as prob_30d
    FROM ecommerce_item_cumulate_count
    WHERE dt>='20191031' AND field='code' AND event_type='cart'
) CO2
ON A.dt=CO2.dt AND A.code_idx=CO2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_bin_count
    WHERE dt>='20191031' AND field='code' AND event_type='view'
) B1
ON A.dt=B1.dt AND A.code_idx = B1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_bin_count
    WHERE dt>='20191031' AND field='code' AND event_type='cart'
) B2
ON A.dt=B2.dt AND A.code_idx = B2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_bin_count
    WHERE dt>='20191031' AND field='category' AND event_type='view'
) C1
ON A.dt=C1.dt AND A.category_idx = C1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_bin_count
    WHERE dt>='20191031' AND field='category' AND event_type='cart'
) C2
ON A.dt=C2.dt AND A.category_idx = C2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_bin_count
    WHERE dt>='20191031' AND field='cat_0' AND event_type='view'
) D1
ON A.dt=D1.dt AND A.cat_0_idx = D1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_bin_count
    WHERE dt>='20191031' AND field='cat_0' AND event_type='cart'
) D2
ON A.dt=D2.dt AND A.cat_0_idx = D2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_bin_count
    WHERE dt>='20191031' AND field='cat_1' AND event_type='view'
) E1
ON A.dt=E1.dt AND A.cat_1_idx = E1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_bin_count
    WHERE dt>='20191031' AND field='cat_1' AND event_type='cart'
) E2
ON A.dt=E2.dt AND A.cat_1_idx = E2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_bin_count
    WHERE dt>='20191031' AND field='cat_2' AND event_type='view'
) F1
ON A.dt=F1.dt AND A.cat_2_idx = F1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_bin_count
    WHERE dt>='20191031' AND field='cat_2' AND event_type='cart'
) F2
ON A.dt=F2.dt AND A.cat_2_idx = F2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_bin_count
    WHERE dt>='20191031' AND field='brand' AND event_type='view'
) G1
ON A.dt=G1.dt AND A.brand_idx = G1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_bin_count
    WHERE dt>='20191031' AND field='brand' AND event_type='cart'
) G2
ON A.dt=G2.dt AND A.brand_idx = G2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_bin_count
    WHERE dt>='20191031' AND field='price_level' AND event_type='view'
) H1
ON A.dt=H1.dt AND A.price_level = H1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_bin_count
    WHERE dt>='20191031' AND field='price_level' AND event_type='cart'
) H2
ON A.dt=H2.dt AND A.price_level = H2.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_bin_count
    WHERE dt>='20191031' AND field='cate_price_level' AND event_type='view'
) I1
ON A.dt=I1.dt AND A.category_idx*10+A.price_level = I1.field_idx
LEFT JOIN (
    SELECT *
    FROM ecommerce_item_bin_count
    WHERE dt>='20191031' AND field='cate_price_level' AND event_type='cart'
) I2
ON A.dt=I2.dt AND A.category_idx*10+A.price_level = I2.field_idx
;
