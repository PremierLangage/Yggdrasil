extends = /model/math/input_eval.pl

title = Trouver un nombre premier

before ==
a = randint(1, 30)
b = a + 10
==

question ==
Donner un nombre premier compris entre {{ a }} et {{ b }} (au sens large).
==

evaluator ==
from random import randint
from latex2sympy import latex2sympy
from sympy import isprime

try:
    ans = latex2sympy(input.get_value())
except:
    score = -1
    feedback = "La réponse doit être un entier."
else:
    if not ans.is_Integer:
        score = -1
        feedback = "La réponse doit être un entier."
    elif not (a <= ans <= b):
        score = 0
        feedback = f"La réponse doit être comprise entre {a} et {b}."
    elif not isprime(ans):
        score = 0
        feedback = "La réponse doit être un nombre premier."
    else:
        score = 100
        feedback = "ouoiuoi"
==