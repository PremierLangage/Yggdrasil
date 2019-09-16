extends = basic.pl

title = Radio

radio =: RadioGroup

before ==
import random as rd
choices=rd.sample(5,list(range(50))
#sol=min(choices)
radio.items=([{"id":str(id),"content":str(content)} for id,content in enumerate(choices)])
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

