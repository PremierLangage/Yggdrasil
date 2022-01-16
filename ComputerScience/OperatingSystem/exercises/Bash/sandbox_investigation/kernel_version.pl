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
tag=système|Unix|terminal|noyau

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Votre réponse
inputbox.maxlength = 2
inputbox.appearance = outline

before==#|python|
nb_attempt=0
==

title==#|markdown|
Quel est la version du noyau ?
==

text==#|markdown|
Il apparait que les sandbox exécutent un noyau Linux, mais quelle est la version 
de révision précise du noyau ? Une option bien choisie de **uname** (R.T.F.M.) 
devrait vous permettre de trouver votre bonheur. Attention, on veut la chaine complète 
décrivant la révision du noyau (il n'a pas que des chiffres et des points normalement).

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
import subprocess
from utils_bash import display_as_shell_this, frame_message

cmd = """uname -r & uname -v | sed -e "s/[ \n]/\n/g" | grep -e "^[0-9]" """
sp = subprocess.Popen(cmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
solution = sp.communicate()[0].decode().replace(' ', '').replace('\n', '')
student_ans = (inputbox.value).replace(' ', '').replace('\n', '')

nb_attempt += 1

grade_attempt = 50 + (200 // (3+nb_attempt))
tenta = '('+str(nb_attempt)+' tentative'
if nb_attempt > 1:
    tenta += 's)'
else:
    tenta += ')'
feedback='<br><p style="margin-bottom: 5px; margin-top: 5px;"><b><u>Efficacité :</u> ' + str(grade_attempt) + '%</b> '+tenta+'</p>'

feedback += solution

if len(student_ans) > 2 and student_ans in solution:
    grade = (100, frame_message("C'est bien cela !", "ok")+feedback)
else:
    grade = (0, frame_message("Ce n'est pas la bonne réponse...", "error")+feedback)
==


