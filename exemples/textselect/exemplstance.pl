


# THIS EXAMPLE IS DEPRECATED SINCE THE COMPONENT WILL BE RENAMED SOON

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py


selectable =: Text
selectable.text ==
The quick brown fox jumps over the lazy red dog.
Portez ce vieux whisky au juge blond qui fume.
Le vif zéphyr jubile sur les kumquats du clown gracieux.
Monsieur jack vous dactylographiez bien mieux que votre ami Wolf.
De grace Jettez vite les kumquats du clown zéphyr. 
==



selectable.mode = word
# le caractère séparateur devrait êêtre espace par défaut.

predicat=lambda s: "grace" not in s

before==
selectable.separator = ' '

# Propriété du mot 


==

title==
Text Select Component
==

text==
Eliminer l'intrus
==

form==
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
