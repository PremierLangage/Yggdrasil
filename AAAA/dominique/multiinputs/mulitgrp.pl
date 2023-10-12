
@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

@ ressources.py

# GENERATE A RANDOM QUESTION
before==
import random
import uuid
from string import ascii_letters
from ressources import *

nb_variables=3
nb_questions = 5
inputs = []
affectations = { var : random.choice(["True","False"]) for var in ascii_letters[:nb_variables] }
affectations_formattees = ", ".join( var + " = " + str(val) for var, val in affectations.items())
res= list()
enonce=list()
for i in range(nb_questions):
    txt,val = evaluer_expression_booleenne2(expression_booleenne_with_errors(ascii_letters[:nb_variables]),affectations)
    while txt in enonce:
            txt,val = evaluer_expression_booleenne2(expression_booleenne_with_errors(ascii_letters[:nb_variables]),affectations)
    enonce.append(txt)
    res.append(val)
#res = ["True","False","Error","True"]
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


    inputs.append({
        "selector": globals()[f"input{i}"].selector,
        "cid": globals()[f"input{i}"].cid
    })





==

title = Evaluer des expression booleennes 


text==
Donnez la valeur booléenne des expressions suivantes, sachant que {{affectations_formattees}}.
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
