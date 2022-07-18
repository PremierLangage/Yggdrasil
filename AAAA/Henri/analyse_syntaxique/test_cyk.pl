@ cyk.py


extends = /model/basic/checkbox.pl

question ==
En utilisaant l'algorithme CYK, déterminez les mots reconnus par la grammaire.
==

before ==#|python|
import time
import cyk

N = 7 
seed = time.time()
rules, good, bad = cyk.generate_input(seed, N)

for w in good:
    right += w + '\n'


for w in bad:
    wrong += w + '\n'
==

right ==
==

wrong ==
==


nbitems = 4
minright = 1
maxright = 2