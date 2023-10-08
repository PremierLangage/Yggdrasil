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

title=Questionnaire préliminaire

text==#|html|
<span style="font-size:1.2em">Merci de répondre le plus naturellement possible avec vos impressions spontannées. La somme des tendances 
offrira une base pour plus de discussions.</span>

<br />
==

question1==
<span style="font-size:1.2em">Si on définit la réussite d'un cours comme un compromis de savoirs et de savoir-faire acquis en moyenne par chaque apprenant; 
quel est, selon votre avis, <b>le facteur le plus impactant</b> pour la réussite d'un cours ? (Désolé, il ne faut en choisir qu'un!)</span>
==

items1==
L'expertise disciplinaire de l'enseignant sur le domaine enseignée.
La qualité de l'activité pédagogique (alignement, supports, organisation, déroulé, etc).
Les conditions d'apprentissage (locaux, horraires, temps face à face, nombre d'apprenants)
L'engagement des apprenants dans leur formation.
Les compétances d'animation pédagogiques de l'enseignant.
Le niveau des élèves en début de formation, leur maîtrise des bases.
==

question2==
<span style="font-size:1.2em"><b>Quelles raisons</b> limitent la réussite des apprenants dans les formations dans lesquelles vous intervenez ?
(plusieurs réponses possibles)</span>
==

items2==
Les élèves ne sont pas toujours disponibles <br />(transports, travail à coté de l'activité étudiante, contraintes fammilliales ou autres contraintes externes).
Les jeunes ne trouvent pas ce qu'ils sont venus chercher. Ils prétendent que les situations professionelles des <br />métiers finaux préparés sont décorrélées des activités pédagogiques de la formation.
Les élèves ne sont pas à leur place, <br />il y a une inadéquation entre leurs profils et la formation qu'ils suivent.
Les élèves n'ont pas suffisement envie de réussir. <br />Ils manquent de motivation et finissent par décrocher.
Les contenus ne sont plus adaptés. <br />Les jeunes ont évolués trop vite par rapport aux formations.
La promotion a trop d'hétérogénéïté et les moyens ne sont <br />pas suffisant pour vraiment adapté le parcours à chaque profil.
==

question3==
<span style="font-size:1.2em">Parmi <b>les dispositifs suivants</b>, lesquels sont utilisés dans vos formations ? (plusieurs réponses possibles)</span>
==

items3==
L'évaluation des enseignements par les apprenants.
Des valorisations régulées de l'implication des apprenants dans la vie de la formation.
Un référecentiel de compétences diffusé dès le début de la formation (voire aux candidats).
Des rétroactions régulières pour garantir l'allignement du programme de formation sur le référentiel.
Un accompagnement institutionnel fort des associations élèves, voire des associations ciblées sur vos formations.
Une implication des apprenants dans le pilotage de vos formations (exemple : conseil de perfectionnement).
Une partie des contenus pédagogiques (matières et ou options) est au choix des apprenants.
==


############################################

group1 =: RadioGroup
group2 =: CheckboxGroup
group3 =: RadioGroup

before==#|python|

group1.items = []
group2.items = []
group3.items = []

for i, item in enumerate(items1.splitlines()):
    group1.items.append({ "id": i, "content": item })

for i, item in enumerate(items2.splitlines()):
    group2.items.append({ "id": i, "content": item })

for i, item in enumerate(items.splitlines()):
    group3.items.append({ "id": i, "content": item })
==

form==

{{ question1 }}

{{ group1|component }}

<br />

{{ question2 }}

{{ group2|component }}

<br />

{{ question3 }}

{{ group3|component }}

==

# EVALUATE THE STUDENT ANSWER
evaluator == #|py|
score = 100
feedback = '<span class="success-state">Réponses enregistrées, merci beaucoup !</span>'

grade = (score, feedback)
==

