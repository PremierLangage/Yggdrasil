#*****************************************************************************
#  Copyright (C) 2022 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

group =: RadioGroup

# GENERATE A RANDOM QUESTION
before==#|python|
# append random false answers to group.items array.
group.items = []

group.items.append({ "id": 1, "content": "Vanille" })
group.items.append({ "id": 2, "content": "Chocolat" })
group.items.append({ "id": 3, "content": "Fraise" })
group.items.append({ "id": 4, "content": "Pomme" })
==

title = Les gouts et les couleurs

text==
Quel est votre parfum préféré ?
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|
S = group.selection
score = 100
feedback = '<span class="success-state animated pulse infinite">Excellent choix !</span>'

#for item in group.items:
#    item['css'] = ''
#    if item['id'] == S:
#        if S == R:
#            item['css'] = 'success-border'
#            score = 100
#            feedback = '<span class="success-state animated pulse infinite">Good answer</span>'
#        else:
#            item['css'] = 'error-border'
#    elif item['id'] == R:
#        item['css'] = 'success-border animated pulse infinite'

grade = (score, feedback)
==

