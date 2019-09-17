extends = basic.pl

title = Radio

radio =: RadioGroup

before ==
import random as rd
choices=rd.sample(list(range(50)),5)
sol=str(min(choices))
radio.items=([{"content":str(content)} for id,content in enumerate(choices)])
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
n=len(radio.items)
score=0
for item in radio.items:
    if item['content']==sol:
        item['css'] = 'success-state anim-fade'
        if item['id']==radio.selection:
            score=100
            break
feedback=""
==

