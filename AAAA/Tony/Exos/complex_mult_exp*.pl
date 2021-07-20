
extends = /model/math/complex.pl

before ==
a, b, c = choice([2,3,4,6,-2,-3,-4,-6]), choice([2,3,4,6,-2,-3,-4,-6]), choice([2,3,4,6,-2,-3,-4,-6])
z1 = randint(-3, 3, [0])*e**(I*pi/a)  
z2 = randint(-3, 3, [0])*e**(I*pi/b)  
z3 = randint(-3, 3, [0])*e**(I*pi/c)  
sol = (z1 * z2/z3).expand()
==

question ==
On considère les nombres complexes $! z_1 = {{ z1|latex }} !$ et $! z_2 = {{ z2|latex }} !$. 
Calculer $! z_1 \times z_2 !$ (sous forme algébrique).
==

complex_form = exponential

solution ==
$! z_1 \times z_2  = ( {{ z1|latex }} ) \times ( {{ z2|latex }} ) = {{ sol|latex }} !$
==

message.NotEqual ==
T'es nul !
==