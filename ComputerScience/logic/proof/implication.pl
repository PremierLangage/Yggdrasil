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

group =: RadioGroup

# GENERATE A RANDOM QUESTION
before==#|python|
import random

all_theo =[{
    'contexte' : "Soit $%p%$ et $%q%$ deux propositions logiques.",
    'théorème' : "$%p \implies q%$",
    'réciproque du théoème' : "$%q \implies p%$",
    'contraposée du théorème' : "$%(non q) \implies (non p)%$",
    'contraposée de la réciproque du théorème' : "$%(non p) \implies (non q)%$"
},{
    'contexte' : "Soit $%p%$ et $%q%$ deux propositions logiques.",
    'théorème' : "$%q \implies p%$",
    'réciproque du théoème' : "$%p \implies q%$",
    'contraposée du théorème' : "$%(non p) \implies (non q)%$",
    'contraposée de la réciproque du théorème' : "$%(non q) \implies (non p)%$"
}
]

theo_dict = random.choice(all_theo)
prev = theo_dict['contexte']
th = theo_dict['théorème']
rt = theo_dict['réciproque du théoème']
ct = theo_dict['contraposée du théorème']
cr = theo_dict['contraposée de la réciproque du théorème']
==

title=Réciproque et contraposée

text==
{{ prev }}
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==
S = group.selection
score = 0
feedback = '<span class="error-state animated pulse infinite">Bad answer</span>'

for item in group.items:
    item['css'] = ''
    if item['id'] == S:
        if S == R:
            item['css'] = 'success-border'
            score = 100
            feedback = '<span class="success-state animated pulse infinite">Good answer</span>'
        else:
            item['css'] = 'error-border'
    elif item['id'] == R:
        item['css'] = 'success-border animated pulse infinite'

grade = (score, feedback)
==


