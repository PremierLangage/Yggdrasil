# Author : D. Doyen
# Last update : 09/01/21
# Keywords : linear systems

extends = model/math/inputgroup.pl

title = Nombre de solutions d'un sytème 2x2

before ==
from sympy2latex import latex_linsys
n = 2
vec = [randint(-2, 2) for _ in range(n)]

def generate_data();
    indexsol = randint(0, 2)
    if indexsol == 0:
        A = randmat_givenrank(n, n, n, magnitude=2)
        B = A*Matrix(vec)
    elif indexsol == 1:
        A = randmat_givenrank(n, n, n-1, magnitude=2)
        B = A*Matrix(vec)
    else:
        A = randmat_givenrank(n, n, n-1, magnitude=2)
        while True:
            perturbation = [0, 0, choice([-1,1])]
            shuffle(perturbation)
            B = A*Matrix(vec) + Matrix(perturbation)
            if linsolve((A, B)) == EmptySet:
                break
    system = latex_linsys(A, B)
    return indexsol, system

for i in range(3):
    indexsol, system = generate_data

system = latex_linsys(A, B)
lstvar = "x, y"
==
