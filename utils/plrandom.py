import random
rd = random.Random()

def randitem(items,excluded_values=[]):
    """
    Pick a random item from a list.
    """
    item=rd.choice(items)
    while item in excluded_values:
        item=rd.choice(items)
    return item

def _list_rand0(n,items,replace,excluded_values):
    """
    Generate a list of random items selected from a list.
    """
    if replace==True:
        lst=[]
        while len(lst)<n:
            item=rd.choice(items)
            if item not in excluded_values:
                lst.append(item)
    elif replace==False:
        m=len(excluded_values)
        lst=rd.sample(items,n+m)
        if m>0:
            lst=[x for x in lst if x not in excluded_values]
            lst=lst[0:n]
    else:
        raise ValueError
    return lst
    
def list_randitem(n,items,excluded_values=[]):
    """
    Generate a list of random items selected from a list with replacements.
    """
    return _list_rand0(n,items,True,excluded_values)

def list_randitem_norep(n,items,excluded_values=[]):
    """
    Generate a list of random items selected from a list without replacements.
    """
    return _list_rand0(n,items,False,excluded_values)

def randint(a,b,excluded_values=[]):
    """
    Pick a random integer.
    """
    item=rd.choice(range(a,b+1))
    while item in excluded_values:
        item=rd.choice(range(a,b+1))
    return item

def list_randint(n,a,b,excluded_values=[]):
    """
    Generate a list of random integers with replacements.
    """
    return _list_rand0(n,range(a,b+1),True,excluded_values)

def list_randint_norep(n,a,b,excluded_values=[]):
    """
    Generate a list of random integers without replacements.
    """
    return _list_rand0(n,range(a,b+1),False,excluded_values)
