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

@ base.py 

# RANDOMIZATION
before== #|python|
import random
import uuid

import sys

with open("base.py","r") as f:
    lines=f.readlines()


state=0
w=[]
current=""
for l in lines :

    if state==0:
        if l=="##BEGIN\n" :
            state=1 
        elif l=="##END\n" :
            print(" Fichier mal structuré END in outside state", file=sys.stderr)
            sys.exit(1)
    elif state==1:
        if l=="##END\n" :
            state = 0
            w.append(current)
            current="" 
        elif l=="##BEGIN\n" :
             print(" Fichier mal structuré BEGIN in inside state ", file=sys.stderr)
             sys.exit(1)
        else:
            current+=l+"<br>"

l=w

sortlist.items = []
answer = []
for ligne in l:
    if len(ligne)>1 :
        e={ "id": uuid.uuid4(),"content":"<pre>"+ligne+"</pre>" }
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


