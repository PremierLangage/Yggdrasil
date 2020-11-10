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
inputbox.type = number
inputbox.placeholder = Entrez votre nombre ici

before==#|python|
from random import choice, randint
from utils_binary_tree import random_binary_tree

Tree_exo = random_binary_tree(randint(8, 14))[0]
viewer.graph = Tree_exo.to_dot_code_BST_point()
height = Tree_exo.height()
nb_leafs = len(Tree_exo.leafs())
max_leaf = max(Tree_exo.leafs())
min_leaf = min(Tree_exo.leafs())
nb_internal = len(Tree_exo.internal_nodes())
max_internal = max(Tree_exo.internal_nodes())
min_internal = min(Tree_exo.internal_nodes())

list_stat = []
list_stat.append( (height, "la hauteur") )
list_stat.append( (nb_leafs, "le nombre de feuilles") )
list_stat.append( (max_leaf, "l'étiquette maximale dans les feuilles") )
list_stat.append( (min_leaf, "l'étiquette minimale dans les feuilles") )
list_stat.append( (nb_internal, "le nombre de nœuds internes") )
list_stat.append( (max_internal, "l'étiquette maximale parmi les nœuds internes") )
list_stat.append( (min_internal, "l'étiquette minimale parmi les nœuds internes") )

soluce, parcours = choice(list_stat)
==

author=Nicolas Borie
title=Statistique dans un arbre binaire

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

Donnez **{{ parcours }}** pour cet arbre.

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

if soluce == inputbox.value:
    grade = (100, ''' <span class="success-state">Bravo, c'est exactement cela : '''+str(soluce)+'</span>')
else:
    grade = (0, ''' <span class="error-state">Désolé, vous avez fait une erreur, la réponse attendue était : '''+str(soluce)+'</span>')
==





