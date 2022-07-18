# Author : D. Doyen
# Last update : 09/01/21
# Keywords : linear systems

extends = /model/math/math.pl
extends = /model/basic/radio.pl


title = Trouver une solution parmi plusieurs

before ==
n = 3
bound = 3
A = randint_matrix_invertible(n, bound, excluded_values=[0])

vec = list_randint(n, -3, 3)
B = A*Matrix(vec)
choices = ["$! %s !$" % str(tuple(vec))]
while len(choices)<4:
    vec=list_randint(n,-3,3)
    if vec not in choices:
        choices.append("$! %s !$" % str(tuple(vec)))

sys_tex = latex_linsys(A, B)

==

text ==
On considère le système suivant (d'inconnues $!x, y, z !$) :
$$ {{sys_tex}} $$

Parmi les propositions suivantes, laquelle est la solution de ce système ?
==

