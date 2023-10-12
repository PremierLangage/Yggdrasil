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
author=ESIEE info AD&D année 1

title=Vos choix d'options personnels

text ==
Sans consultation de vos maitres d'apprentissage et seulement en interrogeant vos goûts personnels, veuillez 
classer les trois options de votre premier voeux (l'option qui vous interesse le plus) à votre troisième voeux 
(l'option qui vous interesse le moins).


<br />
==

question1=<b>Quel est votre premier choix d'option ?</b>

question2=<b>Quel est votre second choix d'option ?</b>

question3=<b>Quel est votre troisième choix d'option ?</b>

items==
Géomatique
Logiciel
Réseaux
==

############################################

group1 =: RadioGroup
group2 =: RadioGroup
group3 =: RadioGroup

before==#|python|
vos_choix = ""

group1.items = []
group2.items = []
group3.items = []

for i, item in enumerate(items.splitlines()):
    group1.items.append({ "id": i, "content": item })
    group2.items.append({ "id": i, "content": item })
    group3.items.append({ "id": i, "content": item })
==

form==

{{ question1 }}

{{ group1|component }}

{{ question2 }}

{{ group2|component }}

{{ question3 }}

{{ group3|component }}

==

# EVALUATE THE STUDENT ANSWER
evaluator == #|py|
score = 100
feedback = '<span class="success-state">Réponse enregistrée</span>'

vos_choix = "<br /><br />"
vos_choix += "<b>Premier choix :</b> " + str(group1.items[group1.selection]['content']) + "<br />"
vos_choix += "<b>Second choix :</b> " + str(group2.items[group2.selection]['content']) + "<br />"
vos_choix += "<b>Troisième choix :</b> " + str(group3.items[group3.selection]['content']) + "<br />"

feedback += vos_choix

grade = (score, feedback)
==


