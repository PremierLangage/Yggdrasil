# Author : D. Doyen
# Last update : 09/01/21
# Keywords : linear systems

extends = nbsol_linsys_.pl

title = Nombre de solutions d'un sytème 2x3

before ==
n = 2
m = 3
d = min(n, m)
indexsol = randint(0, 2)
vec = list_randint(m, -2, 2)

if indexsol == 0:
    A = randint_matrix_givenrank(n, m, d, magnitude=2)
    B = A*Matrix(vec)
elif indexsol == 1:
    A = randint_matrix_givenrank(n, m, d-1, magnitude=2)
    B = A*Matrix(vec)
else:
    A = randint_matrix_givenrank(n, m, d-1, magnitude=2)
    while True:
        perturbation = [0, randitem([-1,1])]
        rd.shuffle(perturbation)
        B = A*Matrix(vec) + Matrix(perturbation)
        if linsolve((A, B)) == EmptySet:
            break

system = latex_linsys(A, B)
lstvar = "x, y, z"
==
