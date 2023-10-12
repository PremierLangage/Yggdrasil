import random
rd = random.Random()

def randint(a, b, excval=[]):
    """
    Return a random integer between two bounds (excluding some values).
    """
    r = rd.randint(a, b)
    while r in excval:
        r = rd.randint(a, b)
    return r

def sampleint(a, b, k, excval=[]):
    """
    Return a sample of random integers between two bounds (excluding some values).
    """
    # Le passage par des listes n'est pas super.
    bound = [a]
    bound.extend(sorted(excval))
    bound.append(b+1)
    lst = []
    for i in range(len(bound)-1):
        lst.extend(list(range(bound[i], bound[i+1])))
    return rd.sample(lst, k)
