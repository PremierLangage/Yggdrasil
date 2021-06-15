# author = Anthony Labarre
# basé sur Yggdrasil/ComputerScience/python/AP1-1920/chapters/1-bases-imperatif/operateursbooleens.pl
# 
# Génération d'expressions booléennes aléatoires sur des variables dont 
# l'affectation est également aléatoire. L'étudiant doit rentrer True ou False
# pour chacune des expressions.
#
# Imports ---------------------------------------------------------------------
@ /utils/sandboxio.py
@ ressources_exercices.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

before== #|python|
from random import randint
from ressources_exercices import expression_booleenne, \
    evaluer_expression_booleenne
from string import ascii_letters

# construction de l'énoncé: nb_questions expressions booléennes aléatoires sur
# nb_variables variables (a, b, c, ...)
nb_questions = 3
nb_variables = 3
variables = ascii_letters[:nb_variables]
affectations = {
    var: [False, True][randint(0, 1)] for var in variables
}
enonce = [expression_booleenne(variables) for _ in range(nb_questions)]

# stockage des résultats
res = [evaluer_expression_booleenne(expr, affectations) for expr in enonce]

# préparation du formatage de l'énoncé; chaque formule doit être une chaîne
# -> conversion de nos tuples de chaînes
enonce = [" ".join(expr) for expr in enonce]
affectations_formattees = ", ".join(
    var + " = " + str(val) for var, val in affectations.items()
)

# associer un champ input à chaque formule
inputs = []
for i in range(nb_questions):
    inp = Input()
    globals()[f"input{i}"] = inp
    inputs.append(inp)
==

evaluator== #|python|

# calcul de la note = somme du nombre de cases dont la valeur est correcte
note = 0
faux = list()
for i in range(nb_questions):
    box = globals()[f"input{i}"]
    try: # ??
        dummy = box.value
    except Exception as e:
        continue
    if box.value == str(res[i]):
        note += 1
    else:
        faux.append(str(i+1))

# affichage du feedback
"""
feedback = '<p style="color:green">Bravo!<p>' 
if note != nb_questions:
    if len(faux) > 1:
        feedback = '<p style="color:red">Les réponses ' + ", ".join(faux) + " sont fausses.</p>"
    else:
        feedback = '<p style="color:red">La réponse ' + ", ".join(faux) + " est fausse.</p>"
grade = (note, feedback)
"""
==

title = Expressions booléennes 

text==
Donnez la valeur booléenne des expressions suivantes, sachant que {{affectations_formattees}}.
==

form== #|html|
<!--Nombre d'essais : {{essai}}-->
<ul>
{% for input in inputs %}
<!--{% if not solved[loop.index0]%}-->
<li>  {{enonce[loop.index0]}} = {{ input|component }}  </li>
{% endif %}
{% endfor %}
</ul>
==
