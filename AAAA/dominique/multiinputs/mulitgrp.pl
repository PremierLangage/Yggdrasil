
@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ debug_before.py

group =: CheckboxGroup
group2 =: CheckboxGroup
# GENERATE A RANDOM QUESTION
before==
import random
import uuid

nb_questions = 3
inputs = []
res = ["True","False","Error"]
R=[]
for i in range(nb_questions):
    globals()[f"input{i}"] = RadioGroup()
    globals()[f"input{i}"].items = list()
    globals()[f"input{i}"].horizontal = True

    for X in ["True","False","Error"]:
        Ri= uuid.uuid4()
        globals()[f"input{i}"].items.append({
            "id":Ri,
            "content": str(X)
        })
        if X==res[i]: # plante si il n'y a pas de bonne réponses
            R.append(Ri)


    inputs.append({
        "selector": globals()[f"input{i}"].selector,
        "cid": globals()[f"input{i}"].cid
    })



enonce=["Q1","Q2","Q3"]


==

title = Checkbox Group Component

text==
Select even numbers.
==

form== #|html|
<!--Nombre d'essais : {{essai}}-->
<ol>
{% for i in inputs %}
<!--{% if not solved[loop.index0]%}-->
<li>  {{enonce[loop.index0]}} = {{i|component}}</li>
<!--{% endif %}-->
{% endfor %}
</ol>

==

# EVALUATE THE STUDENT ANSWER
evaluator==

def validate(group, R):
    S = group.selection
    score = 0
    feedback = '<span class="error-state animated pulse infinite">Bad answer</span>'

    for item in group.items:
        item['css'] = ''
        if item['id'] == S:
            if S == R:
                return 1
            else:
                item['css'] = 'error-border'
        elif item['id'] == R:
            item['css'] = 'success-border animated pulse infinite'
    return 0





feedback=''
# calcul de la note = somme du nombre de cases dont la valeur est correcte
note = 0

for i in range(nb_questions):
    note += validate(globals()[f"input{i}"], R[i])

grade = (note, feedback)
==
