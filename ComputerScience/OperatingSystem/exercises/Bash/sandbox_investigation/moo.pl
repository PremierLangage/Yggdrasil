#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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
@ /ComputerScience/OperatingSystem/templates/utils_bash.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

img_moo =$ /ComputerScience/OperatingSystem/exercises/Bash/sandbox_investigation/moo_today.png

author=Nicolas Borie
tag=système|Unix|terminal|humour

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Votre réponse
inputbox.maxlength = 2
inputbox.appearance = outline

before==#|python|
nb_attempt=0
==

title==#|markdown|
Trêve de plaisanterie !
==

text==#|markdown|
Inutile donc indispensable! Tout comme vos enseignants les plus ravagés, les 
developpeurs de Debian sont des sacrés boute-en-trains, une joyeuse bande de 
déconneurs. C'est très sérieux Debian, une distribution gratuite et réputée 
pour sa robustesse. 

<br>

Donner la commande dont l'exécution sur l'émulateur de terminal donne ce qui 
suit: <br>(sauf la tâche rouge bien sûr, c'est l'anti-spoiler ça !)

<br>

<img src="{{ img_moo }}" alt="Avez-vous meuglé aujourd'hui ?" style="width:50%" />


<br>

Pour cela, utiliser 
<a href="https://pl.u-pem.fr/filebrowser/demo/38096/" target="blank">
l'émulateur de terminal sur sandbox
</a>. Attention, PLaTon n'est pas multi-onglet. Il faut bien fermer vos onglets sur 
l'émulateur de terminal et actualiser l'énoncé de l'exercice avant de soumettre votre 
réponse.

==

form==#|markdown|

<br>

{{ inputbox|component}}
==

evaluator==#|python|
from utils_bash import display_as_shell_this, frame_message

student_ans = (inputbox.value).replace(' ', '').replace('\n', '')

nb_attempt += 1

grade_attempt = 50 + (200 // (3+nb_attempt))
tenta = '('+str(nb_attempt)+' tentative'
if nb_attempt > 1:
    tenta += 's)'
else:
    tenta += ')'
feedback='<br><p style="margin-bottom: 5px; margin-top: 5px;"><b><u>Efficacité :</u> ' + str(grade_attempt) + '%</b> '+tenta+'</p>'

if "apt" in student_ans and "moo" in student_ans:
    grade = (grade_attempt, frame_message("C'est bien cela !", "ok")+feedback)
else:
    grade = (0, frame_message("Ce n'est pas la bonne réponse...", "error")+feedback)
==
