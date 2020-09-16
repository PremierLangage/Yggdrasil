
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py


hints % { "cid": "hints", "selector": "c-hint" }
hints.label = **Bloqué ?** de l'aide ?.
hints.confirmMessage ==
The usage of a hint may affect your final score!
==

hints.shouldConfirm % false
hints.confirmTitle = Are you sure you want a hint ?
hints.confirmOkTitle = Yes
hints.confirmNoTitle = No
hints.items %=
[
    { "content": "Ce n'est pas un Pangramme." }
]
==





selectable =: Text
selectable.text ==
The quick brown fox jumps over the lazy red dog.<br/>
Portez ce vieux whisky au juge blond qui fume.<br/>
Le vif zéphyr jubile sur les kumquats du clown gracieux.<br/>
Monsieur jack vous dactylographiez bien mieux que votre ami Wolf.<br/>
De grace Jettez vite les kumquats du clown zéphyr. 
==



selectable.mode = word
# le caractère séparateur devrait êêtre espace par défaut.

# Propriété du mot 
predicat=lambda s: "grace" in s

before==
selectable.separator = '\n'



==

title==
Text Select Component
==

text==
Eliminer l'intrus
==

form==
{{ hints|component}}
{{ selectable|component}}
==


evaluator==
textselected=''
f=eval(predicat)
good=sum([ 1 for x in selectable.text.split(selectable.separator) if f(x)])
bad = 0
for e in selectable.selections:
    textselected +=  e['content']+' '
    if f(e['content']):
        e['css'] = "success-state"
        good=good-1
    else:
        bad=bad+1

if bad == 0 and good==0:
    score = 100
    msg = '<span class="success-state animated pulse infinite">Good answer<span>'
else:
    score = 0
    msg = '<span class="error-state animated pulse infinite">Bad answer</span>'


grade = (score, msg)
==
