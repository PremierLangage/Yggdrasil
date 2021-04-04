extends = /model/math/complex.pl

title = Multiplier deux nombres complexes

before ==
z1 = randint_complex(5)
z2 = randint_complex(5)
sol = (z1 * z2).expand()
==

text ==
On considère les nombres complexes $! z_1 = {{ z1|latex }} !$ et $! z_2 = {{ z2|latex }} !$. 

Calculer $! z_1 \times z_2 !$ (sous forme algébrique).
==

complex_form = cartesian