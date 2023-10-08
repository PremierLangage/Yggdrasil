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

question1==#|html|
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

question2==#|html|
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

question3==#|html|
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

question4==#|html|
<span style="font-size:1.2em">Quelle est, selon votre ressenti, <b>la plus grande cause d'échec</b> de vos élèves ? (il ne faut en garder qu'un...)</span>
==

items4==
Le manque de moyens (équipements, ratio élèves / profs, temps face à face, etc)
La démotivation et le manque d'investissement des élèves.
Le niveau des apprenants en début de formation, les bases du second degré non acquises.
Les contenus de la formation pas suffisement adaptés aux jeunes.
==

question5==#|html|
<span style="font-size:1.2em">S'il fallait ne garder que <b>le critère le plus important</b> qui rend un activité pédagogiques engageante, ce serait ? </span>
==

items5==
L'alignement de l'activité sur les objectifs de la formation.
La capacité de l'enseignant à motiver les apprenants.
Le coté motivant de l'activité (au sens de Viau : signifiante, diversifiée, challenge, authentique, <br />engagement cognitif, contient des choix, interaction, interdisciplinaire, consignes claires, suffisement ancré dans le temps).
L'enseignant est une pointure remarquable de la discipline enseignée.
La qualité de l'évaluation et sa restitution.
Le niveau général des élèves avant de réaliser l'activité.
==

question6==#|html|
<span style="font-size:1.2em">Parmi les mesures suivantes, laquelle aura <b>le plus d'impact sur l'engagement</b> des apprenants ?</span>
==

items6==
Impliquer les apprenants dans les choix des contenus et pilotage de la formation.
Faire évaluer les enseignements et proposer un retour sur ces enquêtes.
Concevoir un programme pédagogique parfaitement aligné sur les objectifs de formation.
Communiquer sur le pourquoi et justifier systématiquement les activités soumises aux apprenants.
Proposer un maximum d'activité para-scolaire favorisant l'esprit de corps (associations étudiantes, club, sport, etc).
==

question7==#|html|
<span style="font-size:1.2em">Quel facteur vous coute <b>le plus d'énergie et de temps</b> en tant qu'enseignant ?</span>
==

items7==
Des apprenants de niveau mauvais voire inadapté à la formation qu'ils suivent.
Des apprenants réfractaires, rebelles qui remettent systématiquement en question l'utilité des dispositifs pédagogiques.
Les conditions et les moyens de travail (équipement, ratio élèves / profs, temps face à face, etc)
Le suivi quotidien des élèves, gérer leurs problèmes et leurs besoins dans le para-scolaire.
==

question8==#|html|
<span style="font-size:1.2em">Parmi les mesures suivantes, laquelle aura <b>le plus d'impact sur l'engagement</b> des apprenants ?</span>
==

items8==
Favoriser les résultats académiques des élèves faisant preuve d'engagement.
Encourager personnellement et publiquement les élèves faisant preuve d'engagement.
Priser (goodies, avantage de bouche, prix divers) les élèves faisant preuve d'engagement.
Expliquer juste régulièrement qu'il y a forte corélation entre engagement et soft skill. <br />Ainsi, les élèves engagés réalisent souvent de meilleurs carrières que les autres une fois diplômé.
==

############################################

group1 =: RadioGroup
group2 =: CheckboxGroup
group3 =: CheckboxGroup
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


