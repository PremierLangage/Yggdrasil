extends = basic.pl

title = Radio

radio =: RadioGroup

before ==
import random as rd
from utilscomp import RadioGroup_loadContent,RadioGroup_evalByContent
choices=rd.sample(list(range(50)),5)
sol=str(min(choices))
RadioGroup_loadContent(radio,choices)
==

text ==
Sélectionner le plus petit nombre de la liste suivante.
==

form ==
{{ radio | component }}
==

evaluator ==
n=len(radio.items)
==


evaluator ==
score=RadioGroup_evalByContent(radio,sol)
feedback=""
==


