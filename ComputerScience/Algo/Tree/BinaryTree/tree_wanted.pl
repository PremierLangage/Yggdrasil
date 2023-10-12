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
# Generating a random tree makes sure the problem has a solution !!!!
Tree_exo, labels = random_binary_tree(nb_nodes, max_height=max_height)
# height --> a criteria
height = Tree_exo.height()
# nb_leaf --> another criteria
nb_leaf = len(Tree_exo.leafs())
if nb_leaf == 1:
    nb_leaf_str = "1 feuille"
else:
    nb_leaf_str = str(nb_leaf)+" feuilles"
# falling on the left or on the right...
if randint(0,1) == 0:
    falling = "gauche"
else:
    falling = "droit"
# increasing/decreasing tree
if randint(0,1) == 0:
    order = "croissant"
else:
    order = "décroissant"
==


text==#|markdown|
<style>
 .graph-viewer-component {
 pointer-events: none;
}
.error-state{
   padding: 10px;
}
.success-state{
   padding: 10px;
}
</style>

On recherche un arbre ! Vous devez trouver cet arbre ! Pour le décrire, vous 
devrez donner son codage textuel en faisant le parcours profondeur préfixe 
en notant une lettre puis l'étiquette (un nombre entier) pour chaque nœud. 
Comme il y a quatre types de nœuds, il y a quatre lettres possibles :

* `d` (**d**ouble) pour les nœuds ayant deux fils
* `l` (**l**eft) pour les nœuds ayant uniquement un fils gauche
* `r` (**r**ight) pour les nœuds ayant uniquement un fils droit
* `f` (lea**f**) pour les feuilles

N'importe quel arbre pourrait convenir mais l'arbre recherché a les 
caractéristiques suivantes :

* Toutes ses étiquettes sont différentes.
* Il possède **{{ nb_nodes }} nœuds**.
* Il est de **hauteur {{ height }}**.
* Il possède **{{ nb_leaf_str }}**.
* Il est **héréditairement {{ falling }}**.
* Il est **{{ order }}** le long des branches.

==

form==
{{ inputbox|component}}
==

evaluator==#|python|
from components import GraphDrawer
from utils_binary_tree import *

feedback=""

try:
    tree_student=binary_tree_from_code(inputbox.value.replace(' ', ''))
    viewer = GraphDrawer()
    viewer.graph = tree_student.to_dot_code_BST_point()
    feedback += f" \n\n <center><c-graph-viewer graph='{viewer.graph}'></c-graph-viewer></center> <br>"
    constraints=True
except:
    grade = (0, ''' <span class="error-state">Votre code textuel d'arbre est invalide.</span> <br><br>''')
    constraints=False



if constraints:
    # Check that labels are all different
    all_labels = tree_student.preorder_traversal()
    set_labels = set(all_labels)
    if len(set_labels) == tree_student.nb_nodes():
        feedback+='<span class="success-state">Étiquettes uniques... OK</span> <br><br>'
    else:
        constraints=False
        feedback+='<span class="error-state">Étiquettes uniques... erreur</span> <br><br>'

    # Check number of nodes
    if tree_student.nb_nodes() == nb_nodes:
        feedback+='<span class="success-state">Nombre de nœuds... OK</span> <br><br>'
    else:
        constraints=False
        feedback+='<span class="error-state">Nombre de nœuds... erreur</span> <br><br>'
    # Check the height
    if tree_student.height() == height:
        feedback+='''<span class="success-state">Hauteur de l'arbre... OK</span> <br><br>'''
    else:
        constraints=False
        feedback+='''<span class="error-state">Hauteur de l'arbre... erreur</span> <br><br>'''
    # Check number of leafs
    if len(tree_student.leafs()) == nb_leaf:
        feedback+='''<span class="success-state">Nombre de feuilles... OK</span> <br><br>'''
    else:
        constraints=False
        feedback+='''<span class="error-state">Nombre de feuilles... erreur</span> <br><br>'''
    # check the is recursively falling on the good side...
    if (falling == "gauche" and tree_student.is_falling_left()) or (falling == "droit" and tree_student.is_falling_right()):
        feedback+='<span class="success-state">Arbre héréditairement '+falling+'... OK</span> <br><br>'
    else:
        constraints=False
        feedback+='<span class="error-state">Arbre héréditairement '+falling+'... erreur</span> <br><br>'
    # check if the tree is properly increasing/decreasing...
    if (order == "croissant" and tree_student.is_increasing()) or (order == "décroissant" and tree_student.is_decreasing()):
        feedback+='<span class="success-state">Arbre '+order+'... OK</span> <br><br>'
    else:
        constraints=False
        feedback+='<span class="error-state">Arbre '+order+'... erreur</span> <br><br>'

    if constraints:
        feedback+=''' <span class="success-state">Bravo, cet arbre valide toutes les contraintes !</span> <br><br>'''
        form = ""
        grade = (100, feedback)
    else:
        feedback+=''' <span class="error-state">Désolé, au moins une contrainte n'est pas validé.</span> <br><br>'''
        grade = (0, feedback)
==



