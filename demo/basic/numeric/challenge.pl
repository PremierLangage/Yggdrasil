
extends = /model/basic/numeric.pl

before ==
from math import gcd
k = choice([1,2,3])
a = k*randint(5, 10)
b = k*randint(5, 10)
c = a*b//gcd(a, b) + randint(1, 5)
==

question ==
Donner un entier naturel multiple de {{ a }} et {{ b }}, et inférieur à {{ c }}.
==

solution = ""

evaluator ==
if not isinstance(ans, int):
    score = -1
    feedback = "La réponse doit être un entier."
elif ans % a != 0 or ans % b != 0:
    score = 0
    feedback = f"Ce nombre n'est pas un multiple de {a} et {b}"
elif ans > c:
    score = 0
    feedback = f"Ce nombre n'est pas inférieur à {c}."
else:
    score = 100
==