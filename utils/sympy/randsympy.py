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

def randmat(rows, cols, bound, excval=[], sparsity=0):
    """
    Return a random integer matrix.

    rows : number of rows
    cols : number of columns
    bound : bound on entries
    excval : excluded values for entries
    sparsity : proportion of zero entries (value between 0 and 1)
    """
    if isinstance(bound, list):
        binf, bsup = bound
    else:
        binf, bsup = -bound, bound
    nbzeros = int(sp.floor(sparsity*rows*cols))
    entries = [0]*nbzeros + [randint(binf, bsup, excval) for  _ in range(rows*cols-nbzeros)]
    rd.shuffle(entries)
    return sp.Matrix(rows, cols, entries)

def randmat_invertible(size, bound, excval=[], sparsity=0, detbound=[0, sp.S.Infinity]):
    """
    Return an invertible random integer matrix.

    size : number of rows/columns
    bound : bound on entries
    excval : excluded values for entries
    sparsity : proportion of zero entries (value between 0 and 1)
    detbound : bound on determinant
    """
    while True:
        M = randmat_fullrank(size, size, bound, excval=excval, sparsity=sparsity)
        if detbound[0] <= abs(M.det()) <= detbound[1]:
            return M
            
def randmat_fullrank(rows, cols, bound, excval=[], sparsity=0):
    """
    Return a full rank random integer matrix.

    rows : number of rows
    cols : number of columns
    bound : bound on entries
    excval : excluded values for entries
    sparsity : proportion of zero entries (value between 0 and 1)
    """
    while True:
        M = randmat(rows, cols, bound, excval=excval, sparsity=sparsity)
        if M.rank() == min([rows, cols]):
            return M

def randmat_givenrank(rows, cols, rank, magnitude=1):
    """
    Return a given rank random integer matrix.

    rows : number of rows
    cols : number of columns
    rank : rank
    magnitude : size of entries
    """
    while True:
        P = randmat_fullrank(rows, rank, 1)
        Q = randmat_fullrank(rank, cols, magnitude)
        B = P*Q
        zerorows = sum([sum(B.row(i))==0 for i in range(rows)])
        diffrows = len(set([tuple(B.row(i)) for i in range(rows)]))
        diffcols = len(set([tuple(B.col(i)) for i in range(cols)]))
        if zerorows == 0 and diffrows == rows and diffcols == cols:
            return B