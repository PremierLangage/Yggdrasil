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

author=Nicolas Borie
tag=système|distribution|Unix|terminal

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Votre réponse
inputbox.maxlength = 2
inputbox.appearance = outline

before==#|python|
nb_attempt=0
==

title==#|markdown|
Quelle est la distribution du système d'exploitation ?
==

text==#|markdown|
Essayer de determiner quelle est la **distribution** du système d'exploitation utilisé 
dans les sandbox docker de PLaTon. Vous devriez trouver votre bonheur avec la 
fonction **uname** par exemple (avec une bonne option). 

<br>

Pour cela, utiliser 
<a href="https://pl.u-pem.fr/filebrowser/demo/38096/" target="blank">
l'émulateur de terminal sur sandbox
</a>.

==

form==#|markdown|

<br>

{{ inputbox|component}}
==

evaluator==#|python|
from utils_bash import display_as_shell_this, frame_message

nb_attempt += 1

grade_attempt = 50 + (200 // (3+nb_attempt))
tenta = '('+str(nb_attempt)+' tentative'
if nb_attempt > 1:
    tenta += 's)'
else:
    tenta += ')'
feedback='<br><p style="margin-bottom: 5px; margin-top: 5px;"><b><u>Efficacité :</u> ' + str(grade_attempt) + '%</b> '+tenta+'</p>'

moyen = ['Linux', 'linux', 'GNU/Linux']
good = ['Debian', 'debian']

if inputbox.value in good:
    grade = (grade_attempt, frame_message("C'est bien cela !", "ok")+feedback)
else:
    if inputbox.value in moyen:
        grade = (grade_attempt // 2, frame_message("C'est presque ça, vous avez donné le système d'exploitation mais pas la distribution.", "warning")+feedback)
    else:
        grade = (0, frame_message("Ce n'est pas la bonne réponse.", "error")+feedback)
==


