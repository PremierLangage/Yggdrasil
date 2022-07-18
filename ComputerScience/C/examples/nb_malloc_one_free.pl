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

text==#|markdown|
Dans le clip du single **Erreur de segmentation** du groupe **Super Core Crazy Dumped**, il 
apparaît un rapport d'analyse d'un programme avec l'utilitaire **Valgrind**. Sur ce rapport, 
on peut voir que le programmeur n'a prévu qu'un seul appel à la fonction **free**. Mais 
combien d'appels à la fonction **malloc** ont été opéré par le programme ?


<br><center><iframe width="560" height="315" src="https://www.youtube.com/embed/gNxTlgc-Ye8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center><br>

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
if 3851637 == int(inputbox.value):
    grade = (100, '''<span class="success-state">Mais oui, c'est clair!</span> <br> <br>''')
else:
    grade = (0, '''<span class="error-state">Regardez mieux! Même si libérer c'est pourri, il faut le faire quand même !</span> <br> <br>''')
==
