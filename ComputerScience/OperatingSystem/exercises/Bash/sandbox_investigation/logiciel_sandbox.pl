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
@ /ComputerScience/OperatingSystem/templates/utils_bash.py
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
group.items.append({"id": "y4", "content": "l'utilitaire Unix **make**"})
group.items.append({"id": "y5", "content": "le compilateur C **clang**"})

group.items.append({"id": "n2", "content": "le manuel Unix **man**"})
group.items.append({"id": "n3", "content": "l'utilitaire Unix **less**"})
group.items.append({"id": "n4", "content": "la librairie graphiqe **libMLV**"})

random.shuffle(group.items)
==

title=Quels logiciels/utilitaires peut on trouver sur les sandbox ?

text==#|markdown|
Les sandbox sont des systèmes virtuels utilisables à la demande. Pour être 
rapides et performants, il faut que ces systèmes soient les plus légers 
possibles. Comme ce sont des systèmes virtuels réveillés à la
demande sur une énorme bête de course située dans le sous-sol du bâtiment 
Copernic, inutile d'y installer un environement graphique. Parmi les 
logiciels et utilitaires qui suivent, sélectionner lesquels sont installés sur 
les sandbox ?

<br>

Pour cela, utiliser 
<a href="https://pl.u-pem.fr/filebrowser/demo/38096/" target="blank">
l'émulateur de terminal sur sandbox
</a>.

==

# PRESENT THE QUESTION TO THE STUDENT
form==#|markdown|

{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|
from utils_bash import display_as_shell_this, frame_message

right = 0
total = 0
for item in group.items:
    checked = item['checked']
    total += 1
    if ('y' in item['id'] and checked):
        item['css'] = 'success-border'
        right += 1
    elif ('n' in item['id'] and not checked):
        right += 1
    else:
        if checked :
            item['css'] = 'error-border'
        else:
            item['css'] = 'success-border animated pulse infinite'

if total == right:
    grade = (100, frame_message("C'est exactement &ccedil;a !", "ok"))
else:
    feedb = "Vous avez fait "+str(total-right)
    if total-right > 1 :
        feedb += " erreurs."
    else:
        feedb += " erreur."
    grade = ((right*100 // total), frame_message(feedb, "error"))
==