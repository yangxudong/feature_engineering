# coding:utf-8
from odps.udf import annotate
from odps.udf import BaseUDTF


@annotate('* -> string')
class FG(BaseUDTF):
  def process(self, *args):
    features = []
    numerical_fea = args[:-1]
    for i, fea in enumerate(numerical_fea):
      features.append("%d:%.6f" % (i + 1, fea if fea else 0))

    offset = len(numerical_fea) + 1
    categorical_feas = args[-1]

    weekday = categorical_feas["ts_weekday"]
    features.append("%d:1" % (offset + int(weekday)))
    offset += 7

    hour_bin = categorical_feas["hour_bin"]
    features.append("%d:1" % (offset + int(hour_bin)))
    offset += 5

    weekday_hour = categorical_feas["weekday_hour"]
    features.append("%d:1" % (offset + int(weekday_hour)))
    offset += 35

    price_level = categorical_feas["price_level"]
    features.append("%d:1" % (offset + int(price_level)))
    offset += 10

    cat_0_idx = categorical_feas["cat_0_idx"]
    features.append("%d:1" % (offset + int(cat_0_idx)))
    offset += 14

    cat_1_idx = categorical_feas["cat_1_idx"]
    features.append("%d:1" % (offset + int(cat_1_idx)))
    offset += 64

    cat_2_idx = categorical_feas["cat_2_idx"]
    features.append("%d:1" % (offset + int(cat_2_idx)))
    offset += 92

    brand_idx = categorical_feas["brand_idx"]
    features.append("%d:1" % (offset + int(brand_idx)))
    offset += 6354

    if "category_idx" in categorical_feas:
      category_idx = categorical_feas["category_idx"]
      features.append("%d:1" % (offset + int(category_idx)))

    self.forward(' '.join(features))
