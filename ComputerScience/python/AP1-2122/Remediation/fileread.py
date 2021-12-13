
def f2l(filename):#
    with open(filename,"r") as f:
        l = []
        for line in f:
            l.append(line.strip())
    return l



from string import ascii_lowercase
from random import randint, choice
def produce(s):
    """Produce a liste of string of len = len(s)
    
    The frequency of letter s[i] is the highest in column i.
    
    we think we are not lucky ...
    
    each time we choose a letter  in 10% we choose s[i] else we choose random letter in ascii_lowercase
    
    """ 
    lowers =list(ascii_lowercase)
    l=[]
    for i in range(1000):
        ll=[]
        for x in range(len(s)):
            if randint(1,10) < 2 :
                ll.append(s[x])
            else:
                ll.append(choice(lowers ))
        l.append(''.join(ll))
    return l