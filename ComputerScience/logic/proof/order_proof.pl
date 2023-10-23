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
    { "id": "1", "content": "Dans tout triangle, la somme de la mesure des angles est 180 degrés."},
    { "id": "2", "content": "Appliqué au triangle ABC, on en déduit l'équation $% 3x + 2x + x = 180%$."},
    { "id": "3", "content": "Résolvant l'équation, on obtient $%6x = 180%$ et donc $%x = 30%$."},
    { "id": "4", "content": "Cette valeur de $%x%$ reporté au contexte fait que le triangle $%ABC%$ a un angle de mesure $%3x = 90%$ degrés."},
    { "id": "5", "content": "Le triangle $%ABC%$ est bien rectangle en $%A%$."}
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
Soit ABC un triangle tel que l'angle issue de C a pour mesure $% x %$, l'angle 
issue de B a pour mesure $% 2x %$ et l'angle issue de C a pour mesure $% 3x %$.
prouver que le le triangle ABC est un triangle rectangle.

<img src="{{ url_img }}" alt="image de l'énoncé avec le triangle ABC" style="width: 50%;"/>
==

form={{ sortlist|component }}


# EVALUATION
evaluator== #|python|
errors = 0
for i, e in enumerate(sortlist.items):
    e['css'] = 'success-state animated fadeIn'
    if e['id'] != answer[i]:
        e['css'] = 'error-state animated fadeIn'
        errors += 1

if errors == 0:
    grade = (100, '<span class="success-state animated pulse infinite">Good answer</span>')
else:
    grade = (0, f'<span class="error-state animated pulse infinite">{ errors } wrong answers</span>')
==



