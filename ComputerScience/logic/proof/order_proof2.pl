#*****************************************************************************
#  Copyright (C) 2023 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

url_img_triangle =$ /ComputerScience/logic/proof/img/triangle.png

# DECLARATION
sortlist =: SortList

sortlist.items %= #|json|
[
    { "id": "0", "content": "Hypothèse : $%ABC%$ est un triangle dont la mesure des angles est $%x, 2x%$ et $%3x%$ ($%x%$ étant inconnu)."},
    { "id": "1", "content": "Dans tout triangle, la somme de la mesure des angles est 180 degrés."},
    { "id": "2", "content": "Appliqué au triangle ABC, on en déduit l'équation $% 3x + 2x + x = 180%$."},
    { "id": "3", "content": "Résolvant l'équation, on obtient $%6x = 180%$ et donc $%x = 30%$."},
    { "id": "4", "content": "Cette valeur de $%x%$ reportée au contexte fait que le triangle $%ABC%$ a un angle de mesure $%3x = 90%$ degrés en $%A%$."},
    { "id": "5", "content": "Conclusion : Le triangle $%ABC%$ est bien rectangle en $%A%$."}
]
==

# RANDOMIZATION
before== #|python|
import random

url_img = str(url_img_triangle)

random.shuffle(sortlist.items)
==

author=Nicolas Borie

title=Réordonner une preuve

text==#|markdown|
Pour recherche le maximum dans une liste Python d'entier, un élève a produit la fonction suivante :

```.mycode{Python}
def max_liste(L):
    if L == []:
        return None
    max_courrant = L[0]
    for e in L:
        if e > max_courrant:
            max_courrant = e
    return max_courrant
```

==

form={{ sortlist|component }}


# EVALUATION
evaluator== #|python|
errors = 0
for i, e in enumerate(sortlist.items):
    e['css'] = 'success-state animated fadeIn'
    if e['id'] != str(i):
        e['css'] = 'error-state animated fadeIn'
        errors += 1

if errors == 0:
    grade = (100, '<span class="success-state animated pulse infinite" style="padding: 5px;">Bonne r&eacute;ponse</span>')
else:
    grade = (0, f'<span class="error-state animated pulse infinite" style="padding: 5px;">{ errors } r&eacute;ponse mal plac&eacute;e(s)</span>')
==



