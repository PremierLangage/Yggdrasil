extends = /model/basic/matchlist.pl

title = Décomposition de nombres

question ==
Relier chaque nombre à la décomposition qui lui est égale.
==

before ==
from random import randint, sample
matches = []
for a in sample(range(10, 20), 4) :
    b = randint(1, a-1)
    c = a - b
    matches.append([str(a), f"{b} + {c}"])
==
