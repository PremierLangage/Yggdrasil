
extends = /model/basic/numeric.pl

before ==
from math import gcd
k = choice([1,2,3])
a = randint(5, 10)
b = randint(5, 10)
c = a*b//gcd(a, b) + randint(1, 5)
==

question ==
Donner un entier naturel multiple de {{ a }} et {{ b }}, et inférieur à {{ c }}.
==

evaluator ==
if not isinstance(ans, int):
    score = -1
    feedback = "La réponse doit être un entier."
elif ans % k != 0:
    score = 0
    feedback = "Ce nombre n'est pas un multiple de " + str(k) + "."
elif ans < a or ans > b:
    score = 0
    feedback = f"Ce nombre n'est pas compris entre {a} et {b}."
else:
    score = 100
==