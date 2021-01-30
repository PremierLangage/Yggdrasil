#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Votre réponse
inputbox.maxlength = 2
inputbox.appearance = outline

before==#|python|

==

title==#|markdown|
Taille de la partition contentant la racine ?
==

text==#|markdown|
Quelle la taille (en version lisible par un humain (human-readable)) du disque 
qui cotient le repertoire racine des sandbox ?

<br>

Pour cela, utiliser 
<a href="https://pl.u-pem.fr/filebrowser/demo/38058/" target="blank">
l'émulateur de terminal sur sandbox
</a>.

==

form==#|markdown|

<br>

{{ inputbox|component}}
==

evaluator==#|python|
import subprocess
from utils_bash import display_as_shell_this, frame_message

cmd = '''df -H | grep -e "/$" | sed -e "s/[' '\\t\\n]/\\n/g" | sort -rn | head -1'''
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


