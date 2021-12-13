
def f2l(filename):#
    with open(filename,"r") as f:
        l = []
        for line in f:
            l.append(line.strip())
    return l

