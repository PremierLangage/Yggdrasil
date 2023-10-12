# Author : D. Doyen
# Last update : 09/01/21
# Keywords : linear systems

extends = nbsol_linsys_.pl

title = Nombre de solutions d'un sytème 3x2

before ==
n = 3
m = 2
indexsol = randitem([0, 2])
vec = list_randint(m, -2, 2)

if indexsol == 0:
    A = randint_matrix_givenrank(n, m, m, magnitude=2)
    B = A*Matrix(vec)
else:
    A = randint_matrix_givenrank(n, m, m, magnitude=2)
    while True:
        perturbation = [0, 0, randitem([-1,1])]
        rd.shuffle(perturbation)
        B = A*Matrix(vec) + Matrix(perturbation)
        if linsolve((A, B)) == EmptySet:
            break

system = latex_linsys(A, B)
lstvar = "x, y"
==
