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

group =: RadioGroup

screen_FTL =$ /ComputerScience/C/examples/dead.png

title=Mater la rebellion
author=Nicolas Borie

tag=simple|humour|jeu


# GENERATE A RANDOM QUESTION
before==#|python|
import random

group.items = []

group.items.append({"id": "y1", "content": "Humain"})
group.items.append({"id": "y2", "content": "Engi"})
group.items.append({"id": "y3", "content": "Mantis"})
group.items.append({"id": "y4", "content": "Rockman"})
group.items.append({"id": "y5", "content": "Zoltan"})
group.items.append({"id": "y6", "content": "Slug"})

# shuffle the items
random.shuffle(group.items)
==

text==#|markdown|
Ce vaisseau de Mantis de type A possède un équipage particulièrement cosmopolite. 

<img src="{{ screen_FTL }}"/>

Quelle race n'est pas représentée dans cet équipage ?

==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|
S = group.selection
if S == "":
    feedback = '''<span class="error-state animated pulse infinite" style="padding: 10px">Enfin, il faut choisir !</span>'''
    grade = (-1, feedback)
else:
    feedback = '''<span class="success-state animated pulse infinite" style="padding: 10px">Mais oui, ce style est si insane!</span>'''
    grade = (100, feedback)
==



