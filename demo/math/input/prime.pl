extends = /model/math/input.pl

title = Transformer une somme de logarithmes en un logarithme

before ==
k = randint(3, 6)
a = randint(25, 75)
b = a + randint(10, 20)
==

question ==
Donner un entier premier, compris entre {{ a }} et {{ b }} (au sens large).
==

evaluator ==
from latex2sympy import latex2sympy

try:
    ans = latex2sympy(input.value)
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
    elif not (a <= ans <= b):
        score = 0
        feedback = "La réponse doit être un nombre premier."
==

solution ==

==