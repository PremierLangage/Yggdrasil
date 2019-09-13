extends = /Mathematics/template/mathbasic2.pl

component =: CheckboxGroup

form==
{{ component|component }}
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



