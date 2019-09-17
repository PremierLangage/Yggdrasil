extends = basic.pl

title = Checkbox

checkbox =: CheckboxGroup

before ==
import random as rd
nright0=rd.choice(nright)
nwrong0=nchoices-nright0
choices = rd.sample(right,nright0)+rd.sample(wrong,nwrong0)
rd.shuffle(choices)

checkbox.items=([{"id":str(id),"content":content} for id,content in enumerate(choices)])
==

text ==
Sélectionner les villes européennes dans la liste suivante.
==

form ==
{{ checkbox | component }}
==

evaluator ==
ansright,answrong=0,0
for item in checkbox.items:
    if item['content'] in right and item['checked']:
        item['css'] = 'success-state anim-fade'
        ansright+=1
    elif item['content'] in right and not item['checked']:
        item['css'] = 'success-state anim-fade'
        answrong+=1
    elif not (item['content'] in right) and item['checked']:
        answrong+=1

score=max([int((ansright-answrong)/ansright*100),0])
==

