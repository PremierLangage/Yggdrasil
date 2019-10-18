# OCE


doc==

ceci est un template pour des exercice de réorganisation de code
extends=Le_bon_code.pl

pour l'utiliser vous heriter puis vous ajouter une ligne 
@ votrefichier.py [base.py]

et vous placer dans votrefichier.py un code python qui 
a un ordre unique des ses lignes. 

==


@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# DECLARATION
sortlist =: SortList



# RANDOMIZATION
before== #|python|
import random
import uuid

with open("base.py","r") as f:
    l=f.readlines()

sortlist.items = []
answer = []
for ligne in l:
    e={ "id": uuid.uuid4(),"content":ligne }
    sortlist.items.append(e)
    answer.append(e["id"])
random.shuffle(sortlist.items)
==

# FORM
title = Sort List Component
text = *Drag and Drop the items to sort the list*
form = {{ sortlist|component }}


# EVALUATION
evaluator== #|python|
errors = 0
for i, e in enumerate(sortlist.items):
    e['css'] = 'success-state anim-fade'
    if e['id'] != answer[i]:
        e['css'] = 'error-state anim-fade'
        errors += 1

if errors == 0:
    grade = (100, '<span class="success-state">Good answer</span>')
else:
    grade = (0, f'<span class="error-state">{ errors } wrong answers</span>')
==


