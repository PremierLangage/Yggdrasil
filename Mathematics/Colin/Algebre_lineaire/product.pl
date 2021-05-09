extends = /model/math/mathmatrix.pl
title = Image par une application de Z^2 dans Z^2

before ==
A = rand_int_matrix(2, 2, 3)
B = rand_int_matrix(2, 2, 3)
sol = A*B
==

text ==
Soit les matrices
$$ A = \left( {{A|latex}}\right) \text{ et } B = \left({{B|latex}}\right) $$ 
Calculer $! A B !$.
==
