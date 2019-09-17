extends = basic.pl

title = Radio

radio =: RadioGroup

before ==
import random as rd
choices=rd.sample(list(range(50)),5)
sol=min(choices)
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


evaluator ==
if radio.items[int(radio.selection)]['content']==str(sol):
    score=100
else:
    score=0
feedback=""
==

