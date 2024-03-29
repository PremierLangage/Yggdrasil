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
    'réciproque du théorème' : "$%q \implies p%$",
    'contraposée du théorème' : "$% \lnot q \implies \lnot p %$",
    'contraposée de la réciproque du théorème' : "$% \lnot p \implies \lnot q %$"
},{
    'contexte' : "Soit $%A%$ et $%B%$ deux propositions logiques.",
    'théorème' : "$%B \implies A%$",
    'réciproque du théorème' : "$%A \implies B%$",
    'contraposée du théorème' : "$% \lnot A \implies \lnot B %$",
    'contraposée de la réciproque du théorème' : "$% \lnot B \implies \lnot A %$"
},{
    'contexte' : "Soit $%ABC%$ un triangle donc la mesure des cotés opposés aux trois sommets sont $%a, b%$ et $%c%$." ,
    'théorème' : "Si Le triangle est rectangle en C, alors $% a^2 + b^2 = c^2%$",
    'réciproque du théorème' : "Si $% a^2 + b^2 = c^2%$, alors Le triangle est rectangle en C",
    'contraposée du théorème' : "Si $% a^2 + b^2 \\neq c^2%$, alors Le triangle n'est pas rectangle en C",
    'contraposée de la réciproque du théorème' : "Si Le triangle n'est pas rectangle en C, alors $% a^2 + b^2 \\neq c^2%$ "
},{
    'contexte' : "Soit $%5%$ points du plan tel que les triplets $%O, A, B%$ et $%O, P, Q%$ soient alignés (c'est à dire une configuration de type Thalès).",
    'théorème' : "Si les droites $%(AP)%$ et $%(BQ)%$ sont parallèles, alors on a l'égalité des rapports $% \\frac{OA}{OP} = \\frac{OB}{OQ} = \\frac{AB}{PQ} %$",
    'réciproque du théorème' : "Si on a l'égalité des rapports $% \\frac{OA}{OP} = \\frac{OB}{OQ} = \\frac{AB}{PQ}%$, alors les droites $%(AP)%$ et $%(BQ)%$ sont parallèles",
    'contraposée du théorème' : "Si on n'a pas l'égalité des rapports $% \\frac{OA}{OP} = \\frac{OB}{OQ} = \\frac{AB}{PQ}%$, alors les droites $%(AP)%$ et $%(BQ)%$ ne peuvent pas être parallèles",
    'contraposée de la réciproque du théorème' : "Si les droites $%(AP)%$ et $%(BQ)%$ ne sont pas parallèles, alors on ne peut pas avoir l'égalité des rapports $% \\frac{OA}{OP} = \\frac{OB}{OQ} = \\frac{AB}{PQ} %$"
},{
    'contexte' : "Soit $%n%$ un entier n'aturel, on s'intéresse à la parité de $%n%$.",
    'théorème' : "Si $%n%$ est pair, alors le reste de la division euclidienne de $%n%$ par $%2%$ est $%0%$",
    'réciproque du théorème' : "Si le reste de la division euclidienne de $%n%$ par $%2%$ est $%0%$, alors $%n%$ est pair",
    'contraposée du théorème' : "Si le reste de la division euclidienne de $%n%$ par $%2%$ n'est pas $%0%$, alors $%n%$ n'est pas pair",
    'contraposée de la réciproque du théorème' : "Si $%n%$ n'est pas pair, alors le reste de la division euclidienne de $%n%$ par $%2%$ ne peut pas être $%0%$"
}
]

names={
    'théorème' : "l'énoncé du théorème",
    'réciproque du théorème' : "la réciproque du théorème",
    'contraposée du théorème' : "la contraposée du théorème",
    'contraposée de la réciproque du théorème' : "la contraposée de la réciproque du théorème"
}

theo_dict = random.choice(all_theo)
prev = theo_dict['contexte']
th = theo_dict['théorème']
rt = theo_dict['réciproque du théorème']
ct = theo_dict['contraposée du théorème']
cr = theo_dict['contraposée de la réciproque du théorème']

donne, quest = random.sample(list(names.keys()), 2) 

group.items = []
for k in names:
    group.items.append({'id': k, 'content': theo_dict[k]})
random.shuffle(group.items)
==

author=Nicolas Borie

title=Réciproque et contraposée d'une implication logique 

text==
{{ prev }} {{ theo_dict[donne] }} est {{ names[donne] }} (qui est en fait une équivalence), quelle est donc {{ names[quest] }} ?
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|
S = group.selection
score = 0
feedback = '<span class="error-state animated pulse infinite" style="padding: 5px;">Mauvaise r&eacute;ponse</span>'

for item in group.items:
    item['css'] = ''
    if item['id'] == S:
        if S == quest:
            item['css'] = 'success-border'
            score = 100
            feedback = '<span class="success-state animated pulse infinite" style="padding: 5px;">Bonne r&eacute;ponse</span>'
            feedback += '<br /><br /><div class="success-state" style="padding: 5px;">'
            for k in reversed(list(names.keys())):
                feedback += '<br /> ' + names[k] + ' était : ' + theo_dict[k] + '.<br />'
            feedback += '</div>'
        else:
            item['css'] = 'error-border'
    elif item['id'] == quest:
        item['css'] = 'success-border animated pulse infinite'

if score == 0:
    feedback += '<br /><br /><div class="error-state" style="padding: 5px;">'
    for k in reversed(list(names.keys())):
        feedback += '<br /> ' + names[k] + ' était : ' + theo_dict[k] + '.<br />'
    feedback += '</div>'


grade = (score, feedback)
==


