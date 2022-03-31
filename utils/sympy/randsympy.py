import random as rd
from plrandom import randint, sampleint
import sympy as sp

# Polynomials

def randpoly(degree, nbcoeff, bound, var='x'):
    """
    Return a random integr polynomial.

    degree : degree
    nbcoeff : number of nonzero coefficients
    bound : bound on coefficients
    var : variable name
    """
    if isinstance(var, str):
        x = sp.Symbol(var)
    else:
        x = var
    c = [randint(-bound, bound, [0]) for _ in range(nbcoeff)]
    p = [degree] + sampleint(0, degree-1, nbcoeff-1)
    return sum([c[i]*x**p[i] for i in range(nbcoeff)])

# Matrices

def randmat(n, p, bound, excval=[], sparsity=0):
    """
    Return a random integer matrix.

    n : number of rows
    p : number of columns
    bound : bound on entries
    excval : excluded values for entries
    sparsity : proportion of zero entries (value between 0 and 1)
    """
    if isinstance(bound, list):
        binf, bsup = bound
    else:
        binf, bsup = -bound, bound
    nbzeros = int(sp.floor(sparsity*n*p))
    entries = [0]*nbzeros + [randint(binf, bsup, excval) for  _ in range(n*p-nbzeros)]
    rd.shuffle(entries)
    return sp.Matrix(n, p, entries)

def randmat_invertible(n, bound, excval=[], sparsity=0, detbound=[0, sp.S.Infinity]):
    """
    Return an invertible random integer matrix.
    """
    while True:
        M = randmat_fullrank(n, n, bound, excval=excval, sparsity=sparsity)
        if detbound[0] <= abs(M.det()) <= detbound[1]:
            return M
            
def randmat_fullrank(n, p, bound, excval=[], sparsity=0):
    """
    Return a full rank random integer matrix.
    """
    while True:
        M = randmat(n, p, bound, excval=excval, sparsity=sparsity)
        if M.rank() == min([n, p]):
            return M

def randmat_givenrank(n, m, r, magnitude=1):
    """
    Return a given rank random integer matrix.

    n : number of rows
    m : number of columns
    r : rank
    magnitude : size of coefficients
    """
    while True:
        P = randmat_fullrank(n, r, 1)
        Q = randmat_fullrank(r, m, magnitude)
        B = P*Q
        zerorows = sum([sum(B.row(i))==0 for i in range(n)])
        diffrows = len(set([tuple(B.row(i)) for i in range(n)]))
        diffcols = len(set([tuple(B.col(i)) for i in range(m)]))
        if zerorows == 0 and diffrows == n and diffcols == m:
            return B