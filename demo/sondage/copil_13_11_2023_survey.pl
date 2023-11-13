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

url_img_1 =$ /demo/sondage/nb_users.png
url_img_2 =$ /demo/sondage/exos.png
url_img_3 =$ /demo/sondage/pltp_img.png

################### Modifier ici ###########################
author=L'équipe PLaTon/PL

title=PLaTon/PL : Où en est-on ? Où va-t-on ?

text==#|html|
<span style="font-size:1.2em">Voici un petit questionnaire préliminaire avant d'entamer des discussions.</span>

<br />
==

question1==#|html|
<span style="font-size:1.4em; color:black">Quel age a le projet PLaTon/PL actuellement ?</span>

<center><span style="font-size:2.5em">... 2016 2017 2018 2019 2020 2021 2022 2023 2024 ...</span></center>
==

items1==
3 ans
4 ans
5 ans
6 ans
==

question2==#|html|
<span style="font-size:1.4em; color:black">Combien il y a-t-il d'utilisateurs actifs ces deux derniers mois (depuis la rentrée de septembre 2023) ?</span>

<center><img src="{{ url_img_1 }}" alt="nombre d'utilisateur depuis toujours" style="width:40%" /></center>
==

items2==
118
236
341
519
==

question3==#|html|
<span style="font-size:1.4em; color:black">Combien d'exercices sont actuellement dans les ressources ?</span>

<center><img src="{{ url_img_2 }}" alt="images d'exercices de PL" style="width:80%" /></center>
==

items3==
475
871
1327
2885
==

question4==#|html|
<span style="font-size:1.4em; color:black">Combien de fois la plateforme PL a-t-elle été solicitée pour procéder à une évaluation et noter effectivement une proposition de réponse d'apprenant ?</span>
==

items4==
12 421
97 703
767 970
1 522 029
==

question5==#|html|
<span style="font-size:1.4em; color:black">Combien de fiches d'exercices ont été déployé sur la plate forme pour des apprenants ?</span>

<center><img src="{{ url_img_3 }}" alt="miniature d'un PLTP" style="width:40%" /></center>
==

items5==
53
130
217
308
==

question6==#|html|
<span style="font-size:1.4em; color:black">Que s'est faire la plateforme PL actuellement ?</span>
==

items6==
L'analogue de question directe avec visualisation de la répartition des réponses des utilisateurs en direct.
Des questionnaires orthographiques comme le Projet Voltaire.
Des questionnaires remplis de manière annonyme pour proposer des évaluations des enseignements.
Évaluer des réponses dans les langages C, Python, Java, Haskell, NASM, bash, R.
Proposer des dashboards aux élèves pour qu'ils se situent dans leur promotion. 
Des blinds tests en durée limité, inclure des images, des vidéos ou autres incrustations issue du web.
Des QCM aux format AMC-txt, GIFT moodle, Vrai/Faux, numérique, quizz MediaWiki, appareillement, augmenté d'aléatoire.
Des exercices de langues sur le modèle de duolinguo.
==

question7==#|html|
<span style="font-size:1.4em">Quel facteur vous coute <b>le plus d'énergie et de temps</b> en tant qu'enseignant ?</span>
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

q_feedback==
<ul>
<li>Le projet PLaTon/PL a actuellement 6 ans.</li>
<li>Ces deux derniers mois, il y a eu 519 utilisateurs actifs enseignants.</li>
<li>Il y a 2885 fichiers exercices (extension .pl) dans le serveur d'exercices de PL (Yggdrazil).</li>
<li>Les sandbox de PL ont évaluées 767 970 réponses de manière effective (avec note sur 100).</li>
<li>308 fiches d'exercices différentes ont été déployées sur la plate forme pour des apprenants. Certaines, bien avancées, sont redéployées chaque année.</li>
<li>Depuis le dernier déployement de début novembre (il y a deux semaines), PL sait faire l'intégralité des propositions sauf la partie anonymisation des questionnaires sondages.</li><br />
• L'analogue de question directe avec visualisation de la répartition des réponses des utilisateurs en direct.<br />
• Des questionnaires orthographiques comme le Projet Voltaire.<br />
• Des questionnaires remplis de manière annonyme pour proposer des évaluations des enseignements.<br />
• Évaluer des réponses dans les langages C, Python, Java, Haskell, NASM, bash, R.<br />
• Proposer des dashboards aux élèves pour qu'ils se situent dans leur promotion. <br />
• Des blinds tests en durée limité, inclure des images, des vidéos ou autres incrustations issue du web.<br />
• Des QCM aux format AMC-txt, GIFT moodle, Vrai/Faux, numérique, quizz MediaWiki, appareillement, augmenté d'aléatoire.<br />
• Des exercices de langues sur le modèle de duolinguo.<br />
</ul>
==

############################################

group1 =: RadioGroup
group2 =: RadioGroup
group3 =: RadioGroup
group4 =: RadioGroup
group5 =: RadioGroup
group6 =: CheckboxGroup

before==#|python|

group1.items = []
group2.items = []
group3.items = []
group4.items = []
group5.items = []
group6.items = []

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


==

# EVALUATE THE STUDENT ANSWER
evaluator == #|py|
score = 100
feedback = '<span class="success-state" style="padding: 8px;">Réponses enregistrées, merci beaucoup !</span>'

grade = (score, feedback)
==



