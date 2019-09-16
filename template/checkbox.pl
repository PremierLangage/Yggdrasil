extends = basic.pl

checkbox =: CheckboxGroup

before ==
import random as rd

right = ["Paris","Amsterdam","Londres","Berlin","Madrid"]
wrong = ["New-York","Pékin","Le Caire","Buenos-Aires","Tokyo"]

choices = rd.sample(right,3)+rd.sample(wrong,2)
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
n=len(checkbox.items)
nright,nwrong=0,0
for i in range(n):
    if checkbox.items[i]['content'] in right and checkbox.items[i]['checked']:
        checkbox.items[i]['css'] = 'success-state anim-fade'
        nright+=1
    elif checkbox.items[i]['content'] in right and not checkbox.items[i]['checked']:
        checkbox.items[i]['css'] = 'success-state anim-fade'
        nwrong+=1
    elif not (checkbox.items[i]['content'] in right) and checkbox.items[i]['checked']:
        nwrong+=1

score=max([int((nright-nwrong)/nright*100),0])
==

