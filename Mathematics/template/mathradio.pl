extends = /Mathematics/template/mathbasic.pl

title = Radio

radio =: RadioGroup

form ==
{{ radio | component }}
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



