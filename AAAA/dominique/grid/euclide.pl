
euclide==
    Un segment de droite peut être tracé en joignant deux points quelconques.
    Un segment de droite peut être prolongé indéfiniment en une ligne droite.
    Étant donné un segment de droite quelconque, un cercle peut être tracé en prenant ce segment comme rayon et l'une de ses extrémités comme centre.
    Tous les angles droits sont congruents.
    Si deux lignes droites sont sécantes avec une troisième de telle façon que la somme des angles intérieurs d'un côté est inférieure à deux angles droits, alors ces deux lignes sont forcément sécantes de ce côté.
==



@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# DECLARATION
sortlist =: SortList

sortlist.items %= #|json|
[
    { "id": "", "content": "Un segment de droite peut être tracé en joignant deux points quelconques." },
    { "id": "", "content": "Un segment de droite peut être prolongé indéfiniment en une ligne droite." },
    { "id": "", "content": "Étant donné un segment de droite quelconque, un cercle peut être tracé en prenant ce segment comme rayon et l'une de ses extrémités comme centre." },
     { "id": "", "content": "Tous les angles droits sont congruents." },
      { "id": "", "content": "Si deux lignes droites sont sécantes avec une troisième de telle façon que la somme des angles intérieurs d'un côté est inférieure à deux angles droits, alors ces deux lignes sont forcément sécantes de ce côté." }
]
==



# RANDOMIZATION
before== #|python|
import random
import uuid
answer = []
for e in sortlist.items:
    # generate random id because students can
    # guest the answer if ids like 1, 2, 3 are used
    e["id"] = uuid.uuid4()
    answer.append(e["id"])
random.shuffle(sortlist.items)
==

# FORM
title = Elements d'Euclide (300 av. J.-C.)
text ==
 Rangez les Postulats du livre I dans l'ordre classique.

<quote>the Elements became known to Western Europe via the Arabs and the Moors. There, the Elements became the foundation of mathematical education. More than 1000 editions of the Elements are known. In all probability, it is, next to the Bible, the most widely spread book in the civilization of the Western world. »</quote>


==
form = {{ sortlist|component }}


# EVALUATION
evaluator== #|python|
errors = 0
for i, e in enumerate(sortlist.items):
    e['css'] = 'success-state animated fadeIn'
    if e['id'] != answer[i]:
        e['css'] = 'error-state animated fadeIn'
        errors += 1

if errors == 0:
    grade = (100, '<span class="success-state animated pulse infinite">Good answer</span>')
else:
    grade = (0, f'<span class="error-state animated pulse infinite">{ errors } wrong answers</span>')
==
