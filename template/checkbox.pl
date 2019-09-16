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

form ==
{{ checkbox | component }}
==

evaluator ==
score=100
for i in range(len(component.items)):
    if component.items[i]['content'] in right and component.items[i]['checked']:
        component.items[i]['css'] = 'success-state anim-fade'
feedback=""
==

