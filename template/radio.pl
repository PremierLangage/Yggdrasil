extends = basic.pl

title = Radio

radio =: RadioGroup

before ==
import random as rd
from utilscomp import RadioGroup_loadContent
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
from utilscomp import RadioGroup_evalByContent

score=RadioGroup_evalByContent(radio,sol)
grade=(0,str(type(radio)))
==


