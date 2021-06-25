extends = /model/basic/numeric.pl

before ==
from random import randint
a = randint(10, 50)
b = randint(10, 50)
sol = a + b
==

question ==
Donner un entier multiple de {{k}}, compris entre {{ a }} et {{ b }} (inclus).
==


before ==
ans = input.value
if ans % k != 0:
    score = 0
elif ans < a or ans >b:
    score = 0
else:
    score = 100
==
