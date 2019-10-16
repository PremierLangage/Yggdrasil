extends = basic.pl

title = Radio

radio =: RadioGroup

before ==
import random as rd
from utilscomp import RadioGroup_loadContent
choices=rd.sample(list(range(50)),5)
sol=str(min(choices))
RadioGroup_loadContent(radio,choices)
fb=type(radio)
==

text ==
Sélectionner le plus petit nombre de la liste suivante.
==

form ==
{{ radio | component }}
==

evaluator ==
from utilscomp import RadioGroup_evalByContent

score=RadioGroup_evalByContent(radio,sol)
score=0
feedback=fb
==


