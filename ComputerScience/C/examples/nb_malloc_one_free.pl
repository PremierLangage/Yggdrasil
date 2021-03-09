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
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

inputbox =: Input
inputbox.type = number
inputbox.placeholder = Nombre de malloc
inputbox.maxlength = 20
inputbox.appearance = outline

author=Nicolas Borie

tag=vidéo|observation|simple|humour

before==

==

title==
Lire un rapport de Valgrind
==

text==#|makdown|
Dans le clip du single **Erreur de segmentation** 



==

form==
<style>
.error-state{
   padding: 10px;
}
.success-state{
   padding: 10px;
}
</style>

{{ inputbox|component}}
==

evaluator==#|python|
if 2 == int(inputbox.value):
    grade = (100, '''<span class="success-state">Mais oui, c'est clair!</span> <br> <br>''')
else:
    grade = (0, '''<span class="error-state">Regardez mieux! Le chat, c'est celui qui a le plus de poil...</span> <br> <br>''')
==
