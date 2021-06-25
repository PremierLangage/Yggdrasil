extends = /model/basic/numeric.pl

before ==
k = randint(3, 6)
a = randint(25, 75)
b = a + randint(6, 10)
==

question ==
Donner un entier multiple de {{k}}, compris entre {{ a }} et {{ b }} (inclus).
==


evaluator ==
ans = input.value
if ans % k != 0:
    score = 0
elif ans < a or ans >b:
    score = 0
else:
    score = 100
==
