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

@ utils_binary_tree.py
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

viewer =: GraphDrawer

inputbox =: Input
inputbox.type = Text
inputbox.placeholder = Une lettre, un espace, un nombre, un espace, ...

before==#|python|
from random import choice, randint
from utils_binary_tree import random_binary_tree

Tree_exo = random_binary_tree(8)[0]
viewer.graph = Tree_exo.to_dot_code_BST_point()

soluce = Tree_exo.to_string_code()
parcours = "un code textuel"
==

author=Nicolas Borie
title=Codage textuel d'un arbre binaire

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

**Rappel :** `d` nœud ayant deux fils, `l` nœud avec seulement un fils gauche, 
`r` nœud avec seulement un fils droit et `f` pour les feuilles. Un codage textuel 
est une longue chaîne décrivant un parcours profondeur préfixe des nœuds avec,
pour chaque nœuds, la lettre donnant le type du nœud puis un espace, puis son 
étiquette.

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


