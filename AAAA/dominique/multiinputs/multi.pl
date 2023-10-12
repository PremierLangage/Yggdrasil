
# author = Anthony Labarre
# basé sur Yggdrasil/ComputerScience/python/AP1-1920/chapters/1-bases-imperatif/operateursbooleens.pl
# 
# Génération d'expressions booléennes aléatoires sur des variables dont 
# l'affectation est également aléatoire. L'étudiant doit rentrer True ou False
# pour chacune des expressions.
#
# Imports ---------------------------------------------------------------------
@ /utils/sandboxio.py


grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

before== #|python|
from random import randint



# associer un champ input à chaque formule
inputs = []
for i in range(3):
    globals()[f"input{i}"] = Input()
    inputs.append({
        "selector": globals()[f"input{i}"].selector,
        "cid": globals()[f"input{i}"].cid
    })

enonce=["Q1","Q2","Q3"]
res = ["True","False","Error"]







==

evaluator== #|python|
feedback=''
# calcul de la note = somme du nombre de cases dont la valeur est correcte
note = 0
faux = list()
for i in range(3):
    box = globals()[f"input{i}"]
    try: # ??
        dummy = box.value
    except Exception as e:
        feedback = " <p>beurk!</p> "
        continue
    if box.value == str(res[i]):
        note += 1
    else:
        faux.append(str(i+1))

# affichage du feedback
feedback += '<p style="color:green">Bravo!<p>' 
if note != nb_questions:
    if len(faux) > 1:
        feedback = '<p style="color:red">Les réponses ' + ", ".join(faux) + " sont fausses.</p>"
    else:
        feedback = '<p style="color:red">La réponse ' + ", ".join(faux) + " est fausse.</p>"
grade = (note, feedback)
==

title = Validations 

text==
Sachant que {{affectations_formattees}} indiquez la valeur de vérité **True, False, Error**.


Error est dans le cas ou l'expression génére une erreur à l'exécution.

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

