
extends = /template/python.pl

title = Afficher trois valeurs triées

editor.code==
### NE PAS TOUCHER ###

import sys
a, b, c = [int(x) for x in sys.argv[1:]]

### FIN NE PAS TOUCHER ###
==

text ==
Afficher les valeurs des variables `a`, `b` et `c` dans l'ordre croissant.

==

stdout_tests==

before==
import itertools

stdout_tests = ""
for i, p in iterate(itertools.permutations([1, 2, 3])):
    stdout_tests += %i "1 2 3" p[0] p[1] p[2]

raise Exception(stdout_tests)
==
