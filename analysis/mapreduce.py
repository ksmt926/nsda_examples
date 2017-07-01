sample = range(1,11)

def double(x):
    return x * 2

map(double,sample)
# [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

def add(a,b):
    return a + b


# addとサンプル配列に対して、reduceを実行する。
# addはすべての要素に順番に適用される。まず、add(1,2)は3となり、配列が[1,2,3,・・]から[3,3,4,・・・]になる。
# 先頭の数字と次の数字を合算させ、これを最後まで繰り返す（関数型での並列化に便利なパラダイム）
reduce(add, sample)
# 55