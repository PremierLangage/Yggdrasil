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
"Si la suite $% (U\_n)\_{ n \\in \\mathbb{N} } %$ est bornée, alors la suite  est minorée et majorée."]

list_imply_bad=["Si Jacques est titulaire du permis voiture en France, alors Jacques a au moins 18 ans.",
"S'il y a un nombre impair de participants à la soirée, c'est qu'un moins une personne à minima n'est pas venu en couple.",
"Si les extra-terrestres n'existent pas, alors personnes ne peut les avoir rencontré.",
"Si un phénomène est impossible, alors personne ne peut l'avoir vu.",
"Si Akim est le père d'un garçon et d'une fille, alors Akim a au moins deux enfants."]

nb_good = random.randint(2, 4)
nb_good = 4
nb_bad = 4
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
Parmi les implications suivantes, sélectionner celles dont la réciproque est vraie.
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|
right = 0
total = 0
for item in group.items:
    checked = item['checked']
    content = int(item['content'])
    if content % 2 == 0:
        total += 1
        item['css'] = 'success-border animated pulse infinite'
        if checked:
            right += 1
            item['css'] = 'success-border'
    elif checked:
        item['css'] = 'error-border'


if total == 0:
    grade = (100, 'Right')
else:
    grade = ((right / total) * 100, f"{right} / {total}")
==

