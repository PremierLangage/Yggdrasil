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
==

question=Quel est votre parfum préféré ?

items==
Vanille
Chocolat
Fraise
Pomme
==

############################################

group =: RadioGroup

before==#|python|

group.items = []

for i, item in enumerate(items.splitlines()):
    group.items.append({ "id": i, "content": item })
==

form ==

{{ question }}

{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator == #|py|
score = 100
feedback = '<span class="success-state">Réponse enregistrée</span>'




