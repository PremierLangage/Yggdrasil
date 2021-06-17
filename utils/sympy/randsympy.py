import random as rd
import sympy as sp

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

# Polynomials

def randint_poly(d, nc, bound, var='x'):
    """
    Return a random polynomial with integer coefficients.

    d : degree
    nc : number of nonzero coefficients
    bound : bound on coefficients
    var : variable name
    """
    x = sp.Symbol(var)
    c = sampleint(-bound, bound, nc, [0])
    p = [d] + sampleint(0, d-1, nc-1)
    return sum([c[i]*x**p[i] for i in range(nc)])

# Matrices

def randint_matrix(n, p, bound, excval=[], sparsity=0):
    """
    Return a random matrix with integer entries.

    n : number of rows
    p : number of columns
    bound : bound on entries
    excval : excluded values for entries
    sparsity : proportion of zero entries (value between 0 and 1)
    """
    nbzero = int(sp.floor(sparsity*n*p))
    entries0 = [0]*nbzero
    entries1 = sampleint(-bound, bound, n*p-nbzero, excval)
    entries=entries0+entries1
    rd.shuffle(entries)
    return sp.Matrix(n,p,entries)

def randint_matrix_inv(n, bound, excval=[], sparsity=0, mindet=0, maxdet=sp.S.Infinity):
    """
    Return an invertible random matrix with integer entries.
    """
    while True:
        M=randint_matrix_fullrank(n,n,bound,excval,sparsity)
        if mindet <= abs(M.det()) <= maxdet:
            return M
            
def randint_matrix_fullrank(n,p,bound,excval=[],sparsity=0):
    """
    Generate a full rank random matrix with integer entries.
    """
    while True:
        M=randint_matrix(n,p,bound,excval,sparsity)
        if M.rank()==min([n,p]):
            return M

def randint_matrix_givenrank(n, m, r, magnitude=1):
    """
    Generate a nxn random matrix with given rank.

    n : number of rows
    m : number of columns
    r : rank
    magnitude : size of coefficients
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