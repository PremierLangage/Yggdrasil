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

url_clip =$ reflechir.mp4

author=Anonyme

tag=vidéo|observation|simple|humour

# GENERATE A RANDOM QUESTION
before==#|python|
import random

group.items = []
R = 'y1'
group.items.append({"id": "n1", "content": "Ding dong song de Gunther"})
group.items.append({"id": "n2", "content": "Never Gonna Give You Up de Rick Astley"})
group.items.append({"id": "n3", "content": "Turbo Diesel Sport Injection (TDSI) de Rohff"})
group.items.append({"id": "n4", "content": "Façon Sex de Tribal King"})
group.items.append({"id": R, "content": "R&eacute;fl&eacute;chir de Wejdene"})

# shuffle the items
random.shuffle(group.items)
==

title=Reprise d'un tube gigantesque

text==#|markdown|
Un artiste, souhaitant rester anonyme, vous propose le clip suivant
dans lequel il propose une reprise d'une chanson d'une profondeur saisissante. 
Selectionnez-donc le titre et l'auteur original de cette oeuvre magistrale.

<br>

<video width="320" height="240" controls><source src="{{ url_clip }}" type="video/MP4"></video>

==

# PRESENT THE QUESTION TO THE STUDENT
form==
<style>
.error-state{
   padding: 10px;
}
.success-state{
   padding: 10px;
}
</style>

{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|
S = group.selection
score = 0
feedback = '<span class="error-state animated pulse infinite" style="padding: 10px">Non, il faut mieux &eacute;couter...</span>'

for item in group.items:
    item['css'] = ''
    if item['id'] == S:
        if S == R:
            item['css'] = 'success-border'
            score = 100
            feedback = '''<span class="success-state animated pulse infinite" style="padding: 10px">Parfait, vous avez l'oreille!</span>'''
        else:
            item['css'] = 'error-border'
    elif item['id'] == R:
        item['css'] = 'success-border animated pulse infinite'

grade = (score, feedback)
==
