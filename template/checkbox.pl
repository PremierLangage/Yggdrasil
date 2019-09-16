extends = basic.pl

checkbox =: CheckboxGroup

before ==
right = ["Paris","Amsterdam","Londres","Berlin","Madrid"]
wrong = ["New-York","Pékin","Le Caire","Buenos-Aires","Tokyo"]

choices = right

for id,content in enumerate(choices):
    checkbox.items.append({"id":str(id),"content":content})

==

form ==
{{ checkbox |component }}
==

evaluator ==
score=100
for i in range(len(component.items)):
    if sol[i] and component.items[i]['checked']:
        component.items[i]['css'] = 'success-state anim-fade'
    elif sol[i] and not component.items[i]['checked']:
        component.items[i]['css'] = 'error-state anim-fade'
        score=0
    elif not sol[i] and component.items[i]['checked']:
        component.items[i]['css'] = 'error-state anim-fade'
        score=0
feedback=""
==

