extends = /model/basic/numeric.pl

before ==
from random import randint
a = randint(10, 50)
b = randint(10, 50)
sol = a + b
import sys
v = sys.version
==

question ==
Calculer {{ a }} + {{ b }}. {{v}}
==