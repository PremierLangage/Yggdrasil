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
    'contraposée du théorème' : "$%(\neg q) \implies (\neg p)%$",
    'contraposée de la réciproque du théorème' : "$%(\neg p) \implies (\neg q)%$"
},{
    'contexte' : "Soit $%p%$ et $%q%$ deux propositions logiques.",
    'théorème' : "$%q \implies p%$",
    'réciproque du théoème' : "$%p \implies q%$",
    'contraposée du théorème' : "$%(\neg p) \implies (\neg q)%$",
    'contraposée de la réciproque du théorème' : "$%(\neg q) \implies (\neg p)%$"
}
]

names={
    'théorème' : "l'énoncé du théorème",
    'réciproque du théoème' : "la réciproque du théorème",
    'contraposée du théorème' : "la contraposée du théorème",
    'contraposée de la réciproque du théorème' : "la contraposée de la réciproque du théorème"
}

theo_dict = random.choice(all_theo)
prev = theo_dict['contexte']
th = theo_dict['théorème']
rt = theo_dict['réciproque du théoème']
ct = theo_dict['contraposée du théorème']
cr = theo_dict['contraposée de la réciproque du théorème']

donne, quest = random.sample(list(names.keys()), 2) 

group.items = []
for k in names:
    group.items.append({'id': k, 'content': theo_dict[k]})
random.shuffle(group.items)
==

title=Réciproque et contraposée

text==
{{ prev }} Si {{ theo_dict[donne] }} est {{ names[donne] }} du théorème (qui est en fait une équivalence), quelle est donc {{ names[quest] }} ?
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


