extends = /model/basic/matchlist.pl

question ==
Relier chaque nombre à la décomposition qui lui est égale.
==

before ==
matches = []
for a in sampleint(10, 20, 4) :
    b = randint(1, a-1)
    c = a - b
    matches.append([a, f"{b} + {c}"])
==
