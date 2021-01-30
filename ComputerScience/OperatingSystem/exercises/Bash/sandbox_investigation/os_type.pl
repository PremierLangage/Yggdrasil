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
Quel est le système d'exploitation ?
==

text==#|markdown|
Essayer de determiner quel est la distribution du système d'exploitation utilisé dans les sandbox 
docker de PLaTon. Vous devriez trouver votre bonheur avec la fonction **uname**.

Pour cela, utiliser 
<a href="https://pl.u-pem.fr/filebrowser/demo/38058/" target="blank">
l'émulateur de terminal sur sandbox
</a>.

==

form==#|markdown|
{{ inputbox|component}}
==

evaluator==#|python|
from utils_bash import display_as_shell_this, frame_message

moyen = ['Linux', 'linux', 'GNU/Linux']
good = ['Debian', 'debian']

if inputbox.value in good:
    grade = (100, frame_message("C'est bien cela !", "ok"))
else:
    if inputbox.value in moyen:
        grade = (50, frame_message("C'est presque ça, vous avez donné le système d'exploitation mais pas la distribution.", "warning"))
    else:
        grade = (0, frame_message("Ce n'est pas la bonne réponse", "error"))
==


