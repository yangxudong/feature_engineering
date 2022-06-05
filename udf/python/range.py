from odps.udf import annotate

@annotate("*->string")
class Range(object):
    def evaluate(self, stop):
        values = range(stop)
        return ','.join([str(v) for v in values])

    def evaluate(self, start, stop, step=1):
        values = range(start, stop, step)
        return ','.join([str(v) for v in values])
