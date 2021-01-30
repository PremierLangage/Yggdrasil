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
tag=système|Unix|terminal

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Votre réponse
inputbox.maxlength = 2
inputbox.appearance = outline

before==#|python|

==

title==#|markdown|
Trêve de plaisanterie !
==

text==#|markdown|
Inutile donc indispensable ! Comme vos enseignants les plus ravagés, les 
developpeurs de Debian sont des sacrés bout en train. C'est très sérieux 
Debian, une distribution gratuite réputée pour sa robustesse. 

<br>

Donner la commande donc l'exécution sur l'émulateur de terminal donne ça :

<img src="{{ img_moo }}" alt="Avez-vous meuglé aujourd'hui ?" width="50px" />


<br>

Pour cela, utiliser 
<a href="https://pl.u-pem.fr/filebrowser/demo/38096/" target="blank">
l'émulateur de terminal sur sandbox
</a>.

<br>

*Si le bouton valider ne fait rien, copier votre réponse dans le presse-papier, 
actualiser et recoller votre réponse avant de revalider.*

==

form==#|markdown|

<br>

{{ inputbox|component}}
==

evaluator==#|python|
import subprocess
from utils_bash import display_as_shell_this, frame_message

cmd = '''whoami'''
sp = subprocess.Popen(cmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
solution = sp.communicate()[0].decode().replace(' ', '').replace('\n', '')
# errout = sp.stderr.decode()
# returncode = sp.returncode
student_ans = (inputbox.value).replace(' ', '').replace('\n', '')

if student_ans == solution:
    grade = (100, frame_message("C'est bien cela !", "ok"))
else:
    grade = (0, frame_message("Ce n'est pas la bonne réponse...", "error"))
==
