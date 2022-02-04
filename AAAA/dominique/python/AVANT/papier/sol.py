

def deuxpluspetits(a,b,c):
    """
    >>> deuxpluspetits(1,2,3)
    [1, 2]
    >>> deuxpluspetits(2,2,2)
    [2, 2]
    """
    l = [a,b,c]
    l.remove(max(l))
    return l


def paperbox():
    import random
    
    a,b,c = [random.randint(1,30),random.randint(1,30),random.randint(1,30)]
    cotes = [a*b,a*c,b*c]
    m = min(cotes)
    
    ruban = 2*sum(deuxpluspetits(a,b,c))+a*b*c
    return 2*(sum(cotes))+m, f"{a}x{b}x{c}", ruban

def doit(filename):
    total=0
    totalr = 0
    with open(filename,"w") as f:
        for i in range(8000):
            p,t,r = paperbox()
            print(t,file=f)
            total += p
            totalr += r
    pltest0= f"""
    >>> Question1()== {total} # Question1 
    True
    """
    pltest1= f"""
    >>> Question2()==  {totalr} # Question2
    True
    """

    return pltest0,pltest1

                
if __name__== "__main__":

    with open("data","r") as f:
        total = 0
        truban = 0
        for line in f:
            a,b,c = [int(c) for c in line.strip().split("x")]
            cotes = [a*b,a*c,b*c]
            m = min(cotes)
            papier = 2*(sum(cotes))+m
            total += papier
            truban += 2*sum(deuxpluspetits(a,b,c))+a*b*c
   # print(total)
   # print(truban)

