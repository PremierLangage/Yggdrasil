
@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ debug_before.py

group =: CheckboxGroup
group2 =: CheckboxGroup
# GENERATE A RANDOM QUESTION
before==
import random

nb_questions = 3
inputs = []
for i in range(nb_questions):
    globals()[f"input{i}"] = CheckboxGroup()
    globals()[f"input{i}"].items = list()
    globals()[f"input{i}"].horizontal = True

    for X in ["True","False","Error"]:
        globals()[f"input{i}"].items.append({
            "id": str(X),
            "content": str(X)
        })

    inputs.append({
        "selector": globals()[f"input{i}"].selector,
        "cid": globals()[f"input{i}"].cid
    })

enonce=["Q1","Q2","Q3"]
res = ["True","False","Error"]

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
feedback=''
# calcul de la note = somme du nombre de cases dont la valeur est correcte
note = 0
faux = list()
for i in range(nb_questions):
    box = globals()[f"input{i}"]
    try: # ??
        dummy = box.value
    except Exception as e:
        feedback += " <p>beurk! str(e)</p> "
        continue
    if box.value == str(res[i]):
        note += 1
    else:
        faux.append(str(i+1))

# affichage du feedback
feedback += '<p style="color:green">Bravo!<p>' 
if note != nb_questions:
    if len(faux) > 1:
        feedback += '<p style="color:red">Les r&eaccute;ponses ' + ", ".join(faux) + " sont fausses.</p>"
    else:
        feedback += '<p style="color:red">La r&eaccute;ponse ' + ", ".join(faux) + " est fausse.</p>"
grade = (note, feedback)
==
