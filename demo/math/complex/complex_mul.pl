extends = /model/math/complex.pl

title = Multiplication de nombres complexes

before ==
z1 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
z2 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
sol = (z1 * z2).expand()
==

question ==
On considère les nombres complexes $! z_1 = {{ z1|latex }} !$ et $! z_2 = {{ z2|latex }} !$. 
Calculer $! z_1 \times z_2 !$ (sous forme algébrique).
==

complex_form = cartesian

solution ==
$! z_1 \times z_2  = ( {{ z1|latex }} ) \times ( {{ z2|latex }} ) = {{ sol|latex }} !$
==