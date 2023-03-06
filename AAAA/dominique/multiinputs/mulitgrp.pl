
@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup
group2 =: CheckboxGroup
# GENERATE A RANDOM QUESTION
before==
import random
import uuid

if "nb_questions" not in globals():
    nb_questions = 3
#inputs = []
res = ["True","False","Error"]
R=[]
for i in range(nb_questions):
    globals()[f"input{i}"] = RadioGroup()
    globals()[f"input{i}"].items = list()
    globals()[f"input{i}"].horizontal = True

    for X in ["True","False","Error"]:
        Ri= str(uuid.uuid4())
        globals()[f"input{i}"].items.append({
            "id":Ri,
            "content": str(X)
        })
        if X==res[i]: 
            # problem si il n'y a pas de bonne réponses
            R.append(Ri)





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
                item['css'] = 'success-border animated pulse infinite'
                return 1
            else:
                item['css'] = 'error-border'
        elif item['id'] == R:
            item['css'] = 'error-border animated pulse infinite'
    return 0





feedback=''
# calcul de la note = somme du nombre de cases dont la valeur est correcte
note = 0
faux=[]
for i in range(nb_questions):
    if validate(globals()[f"input{i}"], R[i]) == 1 :
        note+=1 
    else: 
         faux.append(str(i+1))

feedback += '<p style="color:green">Bravo!<p>' 
if note != nb_questions:
    if len(faux) > 1:
        feedback = '<p style="color:red">Les r&eacute;ponses ' + ", ".join(faux) + " sont fausses.</p>"
    else:
        feedback = '<p style="color:red">La r&eacute;ponse ' + ", ".join(faux) + " est fausse.</p>"



grade = ((note/nb_questions)*100, feedback)
==
