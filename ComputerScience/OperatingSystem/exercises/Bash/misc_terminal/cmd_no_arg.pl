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

title=Des commandes sans arguments

tag=terminal|unix|commande|argument

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==#|python|
import random

group.items = []

group.items.append({"id": "g1", "content": "`date`"})
group.items.append({"id": "g2", "content": "`cal`"})
group.items.append({"id": "g3", "content": "`pwd`"})
group.items.append({"id": "g4", "content": "`whoami`"})

group.items.append({"id": "b1", "content": "`echo`"})
group.items.append({"id": "b2", "content": "`cat`"})
group.items.append({"id": "b3", "content": "`man`"})
group.items.append({"id": "b4", "content": "`cp`"})

random.shuffle(group.items)
==


text==
Parmi les commandes unix suivantes, selectionnez celles qui s'utilisent naturellement sans argument.
==

# PRESENT THE QUESTION TO THE STUDENT
form==
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
    if ('g' in item['id'] and checked):
        item['css'] = 'success-border'
        right += 1
    elif ('b' in item['id'] and not checked):
        right += 1
    else:
        if checked :
            item['css'] = 'error-border'
        else:
            item['css'] = 'success-border animated pulse infinite'

if total == right:
    grade = (100, frame_message("C'est une question de survie ces réflexes!", "ok"))
else:
    feedb = "Vous avez fait "+str(total-right)
    if total-right > 1 :
        feedb += " erreurs."
    else:
        feedb += " erreur."
    grade = ((right*100 // total), frame_message(feedb, "error"))
==


