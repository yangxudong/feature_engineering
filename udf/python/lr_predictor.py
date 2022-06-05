from odps.udf import annotate
from odps.distcache import get_cache_table
import numpy as np
from math import exp

@annotate('string->double')
class Predictor(object):
    def __init__(self):
        records = get_cache_table('lr_model_owlqn')
        weight = [0] * 9028
        for kvp in records:
            weight[kvp[0]] = kvp[1]
        self.weight = weight

    def evaluate(self, s):
        fea = [1] + [float(f) for f in s.split(',')]
        lsum = np.dot(fea, self.weight)
        prob = 1 / (1 + exp(-lsum))
        return prob
