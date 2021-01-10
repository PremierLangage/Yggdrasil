import random as rd
import sympy as sp

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

# Integers

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

# Complex numbers

def rand_complex_int(bound):
    """
    Generate a random complex number with integer coefficients.
    """
    a,b=list_randint(2,-bound,bound,[0])
    return sp.sympify(a+b*sp.I)

# Finite sets

def rand_finiteset(n,items,excluded_values=[]):
    """
    Generate a random finite set.
    """
    return sp.FiniteSet(*list_randitem_norep(n,items,excluded_values=[]))

def rand_set(n,items,excluded_values=[]):
    """
    Generate a random finite set.
    """
    return sp.FiniteSet(*list_randitem_norep(n,list(items),excluded_values=[]))


# Intervals

def rand_interval_type(a,b):
    """
    Generate an interval with random type of bounds.
    """
    bl=rd.choice([True,False])
    br=rd.choice([True,False])
    return sp.Interval(a,b,left_open=bl,right_open=br)

# Polynomials

def rand_int_poly(d, nc, bound, var='x'):
    """
    Generate a random polynomial with integer coefficients.
    """
    x = sp.Symbol(var)
    c = list_randint(nc, -bound, bound, [0])
    p = [d] + list_randint_norep(nc-1, 0, d-1)
    return sum([c[i]*x**p[i] for i in range(nc)])

# Matrices

def randint_matrix(n, p, bound, excluded_values=[], sparsity=0):
    """
    Generate a random matrix with integer entries.

    n : number of rows
    p : number of columns
    bound : coefficient bound
    excluded_values : list of excluded values for the coefficients
    sparsity : proportion of zero coefficients (value between 0 and 1)
    """
    nbzero = int(sp.floor(sparsity*n*p))
    entries0 = [0]*nbzero
    entries1 = list_randint(n*p-nbzero,-bound,bound,excluded_values)
    entries=entries0+entries1
    rd.shuffle(entries)
    return sp.Matrix(n,p,entries)

def randint_matrix_invertible(n, bound, excluded_values=[], sparsity=0, mindet=0, maxdet=sp.S.Infinity):
    """
    Generate an invertible random matrix with integer entries.
    """
    while True:
        M=rand_int_matrix_fullrank(n,n,bound,excluded_values,sparsity)
        if mindet <= abs(M.det()) <= maxdet:
            return M
            
def randint_matrix_fullrank(n,p,bound,excluded_values=[],sparsity=0):
    """
    Generate a full rank random matrix with integer entries.
    """
    while True:
        M=rand_int_matrix(n,p,bound,excluded_values,sparsity)
        if M.rank()==min([n,p]):
            return M

def randint_matrix_givenrank(n, m, r, magnitude=1):
    """
    Generate a nxn random matrix with given rank.

    n : number of rows
    m : number of columns
    r : rank
    magnitude : parameter defining the size of coefficients
    """
    while True:
        P = randint_matrix_fullrank(n, r, 1)
        Q = randint_matrix_fullrank(r, m, magnitude)
        B = P*Q
        zerorows = sum([sum(B.row(i))==0 for i in range(n)])
        diffrows = len(set([tuple(B.row(i)) for i in range(n)]))
        diffcols = len(set([tuple(B.col(i)) for i in range(m)]))
        if zerorows == 0 and diffrows == n and diffcols == m:
            return B

# Matrices (old versions)

def rand_int_matrix(n,p,bound,excluded_values=[],sparsity=0):
    """
    Generate a random matrix with integer entries.
    """
    nbzero=int(sp.floor(sparsity*n*p))
    entries0=[0]*nbzero
    entries1=list_randint(n*p-nbzero,-bound,bound,excluded_values)
    entries=entries0+entries1
    rd.shuffle(entries)
    return sp.Matrix(n,p,entries)

def rand_int_matrix_invertible(n,bound,excluded_values=[],sparsity=0,mindet=0,maxdet=sp.S.Infinity):
    """
    Generate an invertible random matrix with integer entries.
    """
    while True:
        M=rand_int_matrix_fullrank(n,n,bound,excluded_values,sparsity)
        if mindet <= abs(M.det()) <= maxdet:
            return M
            
def rand_int_matrix_fullrank(n,p,bound,excluded_values=[],sparsity=0):
    """
    Generate a full rank random matrix with integer entries.
    """
    while True:
        M=rand_int_matrix(n,p,bound,excluded_values,sparsity)
        if M.rank()==min([n,p]):
            return M

def rand_int_matrix_givenrank(n,m,r,magnitude=2):
    """
    Generate a nxn random matrix with given rank.
    """
    A=sp.zeros(n,m)
    d=list_randint_norep(r,0,n-1)
    for i in range(r):
        A[d[i],d[i]]=1
    while True:
        P=rand_int_matrix_invertible(n,magnitude)
        Q=rand_int_matrix_invertible(m,magnitude)
        B=P*A*Q
        numzeros=0
        for i in range(n):
            for j in range(m):
                if B[i,j]==0:
                    numzeros += 1
        diffrows=len(set([tuple(B.row(i)) for i in range(n)]))
        diffcols=len(set([tuple(B.col(i)) for i in range(n)]))
        if numzeros < n and diffcols==n and diffrows==n:
            return P*A*Q




