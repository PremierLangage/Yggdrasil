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
author=JDLP 2023

title=

text==#|html|
<span style="font-size:1.2em">Questionnaire préliminaire : merci de répondre le plus naturellement possible... La somme des tendances offrira une base
pour plus de discussions.</span>

<br />
==

question1==
<span style="font-size:1.2em"><b>Si on définit la réussite d'un cours comme un compromis de savoirs et de savoir-faire transmis en moyenne aux apprenants; 
quel est, selon votre avis, le facteur le plus impactant pour la réussite d'un cours ?</b></span>
==

items1==
L'expertise disciplinaire de l'enseignant sur le domaine enseignée.
La qualité de l'activité pédagogique (alignement, supports, organisation, déroulé, etc).
Les conditions d'apprentissage (locaux, horraires, temps face à face, nombre d'apprenants)
L'engagement des apprenants dans leur formation.
Les compétances d'animation pédagogiques de l'enseignant.
Le niveau des élèves en début de formation, leur maîtrise des bases.
==

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

group1.items = []
group2.items = []
group3.items = []

for i, item in enumerate(items1.splitlines()):
    group1.items.append({ "id": i, "content": item })

for i, item in enumerate(items.splitlines()):
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
feedback = '<span class="success-state">Réponses enregistrées, merci beaucoup !</span>'

grade = (score, feedback)
==

