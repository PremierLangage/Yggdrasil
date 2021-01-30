#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

author=Nicolas Borie
tag=système|Unix|terminal|logiciel|utilitaire

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==#|python|
import random
group.items = []

group.items.append({"id": "y1", "content": "la suite de compilation **gcc**"})
group.items.append({"id": "y2", "content": "le compilateur Haskell **ghc**"})
group.items.append({"id": "y3", "content": "un interprèteur **python3**"})

group.items.append({"id": "n1", "content": "le compilateur C **clang**"})
group.items.append({"id": "n2", "content": "le manuel Unix **man**"})
group.items.append({"id": "n3", "content": "l'utilitaire Unix **less**"})


random.shuffle(group.items)
==

title=Quels logiciels/utilitaires peut on trouver sur les sandbox ?

text==#|markdown|
Les sandbox sont des systèmes virtuels utilisables à la demande. Pour être 
rapides et performants, il faut que ces systèmes soient les plus légers 
possibles. Comme ce sont des systèmes virtuels réveillés à la
demande sur une énorme bête de course située dans le sous-sol du bâtiment 
Copernic, inutile d'y installer un environement graphique. Parmi les 
logiciels et utilitaires qui suivent, dire lesquels sont installé sur 
les sandbox ?

==

# PRESENT THE QUESTION TO THE STUDENT
form==#|markdown|

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