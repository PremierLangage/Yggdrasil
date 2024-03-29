#*****************************************************************************
#  Copyright (C) 2023 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==#|python|
import random

list_imply_good=["Si un nombre $%n%$ est pair, alors le reste de la division euclidienne de $%n%$ par $%2%$ est $%0%$.",
"Si le reste de la division euclidienne de $%n%$ par $%7%$ est non nul, alors $%n%$ n'est pas un multiple de $%7%$.",
"Si Marc a réussi l'examen du permis voiture en France, alors Marc a le droit de conduire une voiture en France.",
"Si la suite réelle $% (U\_n)\_{ n \\in \\mathbb{N} } %$ est bornée, alors la suite réelle $% (U\_n)\_{ n \\in \\mathbb{N} } %$ est minorée et majorée.",
"Si un algorithme résout un problème $%P%$, alors l'algorithme retourne en temps fini pour toute donnée $%D%$ une réponse correcte $%P(D)%$."]

list_imply_bad=["Si Jacques est titulaire du permis voiture en France, alors Jacques a au moins 18 ans.",
"S'il y a un nombre impair de participants à la soirée, c'est qu'un moins une personne à minima n'est pas venu en couple.",
"Si les extra-terrestres n'existent pas, alors personnes ne peut les avoir rencontré.",
"Si un phénomène est impossible, alors personne ne peut l'avoir vu.",
"Si Akim est le père d'un garçon et d'une fille, alors Akim a au moins deux enfants.",
"Si `L` est une liste d'entiers Python triée de manière croissante, alors `L[0]` est le minimum de la liste et `L[-1]` est le maximum."]

total = 6
nb_good = random.randint(2, 4)
nb_bad = total - nb_good
group.items = []
for ind in random.sample(list(range(len(list_imply_good))), nb_good):
    group.items.append({"id": str(ind), "content": list_imply_good[ind]})
for ind in random.sample(list(range(len(list_imply_bad))), nb_bad):
    group.items.append({"id": str(20+ind), "content": list_imply_bad[ind]})

random.shuffle(group.items)
==

author=Nicolas Borie

title=Réciproque ou simple implication

text==
Dans cet exercice, on vous propose des implications qui peuvent être mathématiques, 
informatiques ou logiques. Ces propositions sont à considérer comme correctes. On 
rappelle que pour une implication du type $%P \\implies Q%$, sa réciproque 
désigne l'implication $%Q \\implies P%$.


Parmi les implications suivantes, sélectionner celles dont la réciproque est aussi vraie.
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|
right = 0
for item in group.items:
    checked = item['checked']
    if int(item['id']) < 20:
        item['css'] = 'success-border animated pulse infinite'
        if checked:
            right += 1
            item['css'] = 'success-border'
    elif checked:
        item['css'] = 'error-border'
    else:
        right += 1


if right == total:
    grade = (100, '<span class="success-state animated pulse infinite" style="padding: 5px;">Bonne r&eacute;ponse</span>')
else:
    grade = ((right*100) // total, '<span class="error-state animated pulse infinite" style="padding: 5px;">Mauvaise r&eacute;ponse</span>')
==

