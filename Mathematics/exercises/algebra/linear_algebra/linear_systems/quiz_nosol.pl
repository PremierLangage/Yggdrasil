# Author : D. Doyen
# Last update : 09/01/21
# Keywords : linear systems

extends = /model/math/math.pl
extends = /model/basic/radio.pl

shuffle % false

choices ==
Une unique solution
Une infinité de solutions
Aucune solution
==

title = Nombre de solutions d'un sytème 3x3

before ==
indexsol = randint(0, 2)
if indexsol == 0:
    A = randint_matrix_givenrank(3, 3, , magnitude=2)
    B = A*Matrix(list_randint(2, -3, 3))
else:
    A = randint_matrix_givenrank(3, 2, , magnitude=2)
    vec = list_randint(2, -3, 3) 


sys_tex = latex_linsys(A, B)

==

text ==
On considère le système suivant (d'inconnues $!x, y, z !$) :
$$ {{sys_tex}} $$
Combion de solutions possède ce système ?
==

