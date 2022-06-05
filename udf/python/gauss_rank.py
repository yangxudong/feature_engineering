from scipy.special import erfinv
from odps.udf import annotate
import numpy as np


@annotate("bigint,bigint->double")
class GaussRank(object):
    def evaluate(self, rank, max_rank):
        if None in (rank, max_rank):
            return 0
        epsilon = 1e-6
        r = (rank/max_rank-0.5)*2 # scale to (-1,1)
        r = np.clip(r,-1+epsilon,1-epsilon)
        return erfinv(r)
