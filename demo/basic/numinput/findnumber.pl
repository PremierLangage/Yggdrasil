extends = /model/basic/numinput.pl

before ==
k = randint(3, 6)
a = randint(25, 75)
b = a + randint(6, 10)
==

question ==
Donner un entier multiple de {{k}}, compris entre {{ a }} et {{ b }} (inclus).
==

evaluator ==
ans = inputfield.get_value()
if ans % k != 0:
    score = 0
    feedback = "Ce nombre n'est pas un multiple de " + str(k) + "."
elif ans < a or ans > b:
    score = 0
    feedback = f"Ce nombre n'est pas compris entre {a} et {b}."
else:
    score = 100
==

solution ==
==