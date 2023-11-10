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

################### Modifier ici ###########################
author=L'équipe PLaTon/PL

title=PLaTon/PL : Où en est-on ? Où va-t-on ?

text==#|html|
<span style="font-size:1.2em">Voici un petit questionnaire préliminaire aux discussions.</span>

<br />
==

question1==#|html|
<span style="font-size:1.2em">Quel age a le projet PLaTon actuellement ?</span>
==

items1==
3 ans
4 ans
5 ans
6 ans
==

question2==#|html|
<span style="font-size:1.2em"><b>Quelles raisons</b> limitent la réussite des apprenants dans les formations dans lesquelles vous intervenez ?
(plusieurs réponses possibles)</span>
==

items2==
1
2
==

question3==#|html|
<span style="font-size:1.2em">Parmi <b>les dispositifs suivants</b>, lesquels sont utilisés dans vos formations ? (plusieurs réponses possibles)</span>
==

items3==
1
2
==

question4==#|html|
<span style="font-size:1.2em">Quelle est, selon votre ressenti, <b>la plus grande cause d'échec</b> de vos élèves ? (il ne faut en garder qu'un...)</span>
==

items4==
1
2
==

question5==#|html|
<span style="font-size:1.2em">S'il fallait ne garder que <b>le critère le plus important</b> qui rend un activité pédagogiques engageante, ce serait ? </span>
==

items5==
1
2
==

question6==#|html|
<span style="font-size:1.2em">Parmi les mesures suivantes, laquelle aura <b>le plus d'impact sur l'engagement</b> des apprenants ?</span>
==

items6==
1
2
==

question7==#|html|
<span style="font-size:1.2em">Quel facteur vous coute <b>le plus d'énergie et de temps</b> en tant qu'enseignant ?</span>
==

items7==
1
2
==

question8==#|html|
<span style="font-size:1.2em">Parmi les mesures suivantes, laquelle aura <b>le plus d'impact sur l'engagement</b> des apprenants ?</span>
==

items8==
1
2
==

############################################

group1 =: RadioGroup
group2 =: RadioGroup
group3 =: RadioGroup
group4 =: RadioGroup
group5 =: RadioGroup
group6 =: RadioGroup
group7 =: RadioGroup
group8 =: RadioGroup

before==#|python|

group1.items = []
group2.items = []
group3.items = []
group4.items = []
group5.items = []
group6.items = []
group7.items = []
group8.items = []

for i, item in enumerate(items1.splitlines()):
    group1.items.append({ "id": i, "content": item })

for i, item in enumerate(items2.splitlines()):
    group2.items.append({ "id": i, "content": item })

for i, item in enumerate(items3.splitlines()):
    group3.items.append({ "id": i, "content": item })

for i, item in enumerate(items4.splitlines()):
    group4.items.append({ "id": i, "content": item })

for i, item in enumerate(items5.splitlines()):
    group5.items.append({ "id": i, "content": item })

for i, item in enumerate(items6.splitlines()):
    group6.items.append({ "id": i, "content": item })

for i, item in enumerate(items7.splitlines()):
    group7.items.append({ "id": i, "content": item })

for i, item in enumerate(items8.splitlines()):
    group8.items.append({ "id": i, "content": item })
==

form==#|html|

{{ question1 }}

{{ group1|component }}

<br />
<br />

{{ question2 }}

{{ group2|component }}

<br />
<br />

{{ question3 }}

{{ group3|component }}

<br />
<br />

{{ question4 }}

{{ group4|component }}

<br />
<br />

{{ question5 }}

{{ group5|component }}

<br />
<br />

{{ question6 }}

{{ group6|component }}

<br />
<br />

{{ question7 }}

{{ group7|component }}

<br />
<br />

{{ question8 }}

{{ group8|component }}

==

# EVALUATE THE STUDENT ANSWER
evaluator == #|py|
score = 100
feedback = '<span class="success-state">Réponses enregistrées, merci beaucoup ! Reremplir et revalider le questionnaire aura pour effet de mettre à jour vos réponses personnelles.</span>'

grade = (score, feedback)
==



