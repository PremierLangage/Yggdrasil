extends = /model/basic/matchlist.pl

title = Décomposition de nombres

text ==
Relier chaque nombre à la quantité qui lui est égale.
==

before ==
from random import randint
matches = []
for i in range(4):
    a = range(10, 20):
    b = range(0, a)
    c = a - b
    matches.append([str(a), f"{b} + {c}"]
==
