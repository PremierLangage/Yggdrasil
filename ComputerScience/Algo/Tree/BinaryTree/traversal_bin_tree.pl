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

viewer =: GraphDrawer

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Séparez les valeurs avec des virgules

taille_arbre=8
hauteur_max=3

before==#|python|
from random import choice
from utils_binary_tree import random_binary_tree

Tree_exo = random_binary_tree(int(taille_arbre), max_height=int(hauteur_max))[0]
viewer.graph = Tree_exo.to_dot_code_BST_point()
inorder_trans = Tree_exo.inorder_traversal()
preorder_trans = Tree_exo.preorder_traversal()
postorder_trans = Tree_exo.postorder_traversal()
breadth_trans = Tree_exo.breadth_first_traversal()

soluce, parcours = choice([(inorder_trans, "parcours profondeur infixe"), (preorder_trans, "parcours profondeur préfixe"), (postorder_trans, "parcours profondeur postfixe"), (breadth_trans, "parcours en largeur")])
==

author=Nicolas Borie
title=Parcours dans un arbre binaire

text==
<style>
 .graph-viewer-component {
 pointer-events: none;
}
</style>

Voici un arbre binaire. L'arbre vide est représenté par un point, les feuilles 
sont donc les nœuds ayant à la fois un point pour fils gauche et fils droit.

<center>
{{ viewer|component }}
</center>

Donnez un **{{ parcours }}** des valeurs contenues dans cet arbre.

==

form==
{{ inputbox|component}}
==

evaluator==#|python|
form = """
<style>
.error-state{
   padding: 10px;
}
.success-state{
   padding: 10px;
}
</style>
"""

if soluce == eval("["+inputbox.value+"]"):
    grade = (100, ''' <span class="success-state">Bravo, c'est exactement cela : '''+str(soluce)[1:-1]+'</span>')
else:
    grade = (0, ''' <span class="error-state">Désolé, vous avez fait une erreur, le parcours attendu était : '''+str(soluce)[1:-1]+'</span>')
==




