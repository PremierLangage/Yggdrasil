
# au 17/08/2021 test OCE : ne marche pas !!!
# y a pas de TAG
# Grosse modification pour utiliser multiinput en modifiant l'évaluateur car le eval de textinput
# ne fonctionne pas

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

extends = /model/basic/multinput.pl

nbechec%0

before== #|python|
import random
import sys
essai = 1
N = 3
boolval = ["True","False","not True","not False"]
op1 = [random.choice(boolval) for n in range(N)]
op2 = [random.choice(boolval) for n in range(N)]
op3 = [random.choice(boolval) for n in range(N)]
ope = [random.choice(list({'and','or'})) for n in range(N)]
ope2 = [random.choice(list({'and','or'})) for n in range(N)]
enonce=[]
for n in range(N):
    enonce.append(op1[n]+' '+ope[n]+' '+op2[n]+' '+ope2[n]+' '+op3[n])
res = [ str(eval(enonce[n])) for n in range(N)]

solved=[ False for n in range(N)]
isfloat = [ False for n in range(N)]
inputs = []
for i in range(N):
    inp = TextInput()
    inp.sol = res[i]
    inputs.append(inp)
    # globals()[f"input{i}"] = inputs[i]
    

==



title = Expressions booléennes 
# y a pas besoin d'énoncé 
question==
Attention vous avez un nombre limité d'essai pour répondre a toutes les égalitées.

Sinon cela redémarre au début avec {{N}} égalités.

Oui heureusement il y en a des faciles...

**Attention il faut fournir une valeur booléenne: True ou False sur chaque ligne.**
==

inputblock== #|html|
<ul>

{% for input in inputs %}
{% if not solved[loop.index0]%}
<li>  {{enonce[loop.index0]}} = {{input|html}}  </li>
{% endif %}
{% endfor %}
</ul>

==


evaluator == #|py|
# Evaluate all input fields
for input in inputs:
    if input.sol == input.data['value']:
        input.score = 100
    else:
        input.score = 0

# Compute score   
scores = [input.score for input in inputs]
if -1 in scores:
    score = -1
else:
    score = sum(scores)//len(scores)

# Display feedback
if score != -1:
    for input in inputs:
        input.display_feedback()
else:
    for input in inputs:
        if input.score == -1:
            input.display_feedback()
        else:
            input.hide_feedback()

# Disable input fields
if score != -1:
    for input in inputs:
        input.disable()
==


