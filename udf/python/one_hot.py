from odps.udf import annotate


@annotate("bigint,bigint->string")
class OneHot(object):
    def evaluate(self, rank, max_rank):
        values = [0] * max_rank
        values[rank] = 1
        return ','.join([str(n) for n in values])
