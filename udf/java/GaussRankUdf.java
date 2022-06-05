package com.aliyun.odps.udf;

import java.lang.Double;
import java.lang.Long;
import javax.annotation.Generated;

@Generated(
    value = "com.aliyun.pai.annotatio.UdfProcessor",
    date = "Mon May 16 17:56:12 CST 2022",
    comments = "@author: weisu.yxd"
)
public class GaussRank extends UDF {
  private final com.aliyun.pai.udf.GaussRank udfObject = new com.aliyun.pai.udf.GaussRank();

  public Double evaluate(Long rank, Long maxRank) {
    return udfObject.evaluate(rank,maxRank);
  }

  public Double evaluate(Double percentRank) {
    return udfObject.evaluate(percentRank);
  }
}
