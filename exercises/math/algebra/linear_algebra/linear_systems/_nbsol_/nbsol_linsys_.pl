# Author : D. Doyen
# Last update : 09/01/21
# Keywords : linear systems

extends = /model/math/radio.pl

title = Nombre de solutions d'un sytème 3x3

shuffle = False

items ==
Une unique solution
Une infinité de solutions
Aucune solution
==

before ==
indexsol = randint(0, 2)
vec = [randint(-2, 2) for _ in range(3)]

if indexsol == 0:
    A = randmat_givenrank(3, 3, 3, magnitude=2)
    B = A*Matrix(vec)
elif indexsol == 1:
    A = randmat_givenrank(3, 3, 2, magnitude=2)
    B = A*Matrix(vec)
else:
    A = randmat_givenrank(3, 3, 2, magnitude=2)
    while True:
        perturbation = [0, 0, randitem([-1,1])]
        rd.shuffle(perturbation)
        B = A*Matrix(vec) + Matrix(perturbation)
        if linsolve((A, B)) == EmptySet:
            break

system = latex_linsys(A, B)
lstvar = "x, y, z"
==

question ==
On considère le système suivant (d'inconnues $!x, y, z !$) :
$$ {{system}} $$
Combion de solutions possède ce système ?
==

