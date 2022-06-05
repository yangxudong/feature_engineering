package com.aliyun.pai.udf;

import com.aliyun.pai.annotation.GenerateUdf;
import com.aliyun.pai.annotation.UdfMethod;
import org.apache.commons.math3.special.Erf;

@GenerateUdf
public class GaussRank {
    @UdfMethod
    public Double evaluate(Long rank, Long maxRank) {
        if (null == rank || null == maxRank) {
            return 0d;
        }
        if (maxRank <= 0L || rank < 0) {
            return 0d;
        }
        if (rank > maxRank) {
            System.err.println("rank is larger than max_rank");
        }
        double epsilon = 1e-6;
        double r = 2.0 * ((double) rank/maxRank-0.5);  // scale to (-1,1)
        if (r < -1.0 + epsilon) {
            r = -1.0 + epsilon;
        }
        if (r > 1.0 - epsilon) {
            r = 1.0 - epsilon;
        }
        return Erf.erfInv(r);
    }

    @UdfMethod
    public Double evaluate(Double percentRank) {
        if (null == percentRank) {
            return 0d;
        }
        if (percentRank < 0L || percentRank > 1) {
            System.err.println("precent rank is not in [0, 1]");
            return 0d;
        }
        double epsilon = 1e-6;
        double r = 2.0 * (percentRank-0.5);  // scale to (-1,1)
        if (r < -1.0 + epsilon) {
            r = -1.0 + epsilon;
        }
        if (r > 1.0 - epsilon) {
            r = 1.0 - epsilon;
        }
        return Erf.erfInv(r);
    }
}
