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

@ ../templates/utils_binary_tree.py
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

author=Nicolas Borie

title=Construire l'arbre qui va bien !
tag=arbre|algo|binaire|recherche|hereditairement|gauche|droit|hauteur|croissant

viewer =: GraphDrawer

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Une lettre un nombre, une lettre un nombre...

before==#|python|
from random import choice, randint
from utils_binary_tree import random_binary_tree

nb_nodes = randint(4,8)
max_height = randint(3,5)
Tree_exo, labels = random_binary_tree(nb_nodes, max_height=max_height)

height = Tree_exo.height()
==


text==
<style>
 .graph-viewer-component {
 pointer-events: none;
}
</style>

On recherche un arbre ! Vous devez trouver cet arbre ! Pour le décrire, vous 
devrez donner son codage textuel en faisant le parcours profondeur préfixe 
en notant une lettre puis l'étiquette pour chaque nœud. Comme il y a quatre 
types de nœuds, il y a quatre lettre possible :

* `d` pour les nœuds ayant deux fils
* `l` pour les nœuds ayant uniquement un fils gauche
* `r` pour les nœuds ayant uniquement un fils droit
* `f` pour les feuilles

N'importe quel arbre pourrait convenir mais l'arbre recherché a les 
caractéristiques suivantes :

* Il possède **{{ nb_nodes }} nœuds**.
* Il est de **hauteur {{ height }}**.


==

form==
{{ inputbox|component}}
==

evaluator==#|python|
from utils_binary_tree import *

constraints=True
feedback = """
<style>
.error-state{
   padding: 10px;
}
.success-state{
   padding: 10px;
}
</style>
"""
feedback+=" \n <center>\n  {{ viewer|component }}  \n</center> \n\n<br>"
tree_student=binary_tree_from_code(inputbox.value.replace(' ', ''))


if tree_student.nb_nodes() == nb_nodes:
    feedback+='<span class="success-state">Nombre de nœuds... OK</span> <br><br>'
else:
    constraints=False
    feedback+='<span class="error-state">Nombre de nœuds... erreur</span> <br><br>'

if tree_student.height() == height:
    feedback+='''<span class="success-state">Hauteur de l'arbre... OK</span> <br><br>'''
else:
    constraints=False
    feedback+='''<span class="error-state">Hauteur de l'arbre... erreur</span> <br><br>'''

if constraints:
    feedback+=''' <span class="success-state">Bravo, cet arbre valide toutes les contraintes !</span>'''
    grade = (100, feedback)
else:
    feedback+=''' <span class="error-state">Désolé, au moins une contrainte n'est pas validé.</span>'''
    grade = (0, feedback)
==



