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

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: RadioGroup

url_phot =$ flute.jpg
url_clip =$ partenaire.mp3

author=Nicolas Borie

tag=audio|écoute|simple|humour


# GENERATE A RANDOM QUESTION
before==#|python|
import random

group.items = []
R = 'y1'
group.items.append({"id": "n1", "content": "Macumba de Jean Pierre Mader"})
group.items.append({"id": "n2", "content": "Voyage Voyage de Desireless"})
group.items.append({"id": "n3", "content": "Les Démons de minuit du groupe Images"})
group.items.append({"id": "n4", "content": "Ding Dong Song de Gunther"})
group.items.append({"id": R, "content": "Partenaire particulier du groupe Partenaire particulier"})

# shuffle the items
random.shuffle(group.items)
==

title=Cette flûte va vous terminer...

text==#|markdown|
Entre deux exercices à propos du terminal Unix, un animal orchestre (un peu comme 
un homme orchestre mais en plus sauvage) a tenté une réinterprétation d'une 
célèbre chanson des années 80. Quelle est cette chanson ?

<br>

<center>
<div>
<img src="{{ url_phot }}" style="width:30%" alt="les instruments de musiques de l'enfer"/><br>
<audio controls>
  <source src="{{ url_clip }}" type="audio/mp3">
  Votre navigateur ne supporte pas la lecture du clip audio.
</audio>
</div>
</center>
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|
S = group.selection
score = 0
feedback = '<span class="error-state animated pulse infinite" style="padding: 10px">Non, il faut mieux écouter...</span>'

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


