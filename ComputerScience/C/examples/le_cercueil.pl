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

url_phot =$ pedalier.jpg
url_clip =$ tortues_ninjas.mp3

author=Nicolas Borie

tag=audio|écoute|simple|humour


# GENERATE A RANDOM QUESTION
before==#|python|
import random

group.items = []
R = 'y1'
group.items.append({"id": "n1", "content": "J'en peux plus le confinement avec toi."})
group.items.append({"id": "n2", "content": "Je préfère boumbo, petite automobile."})
group.items.append({"id": "n3", "content": "Pourquoi le père noël a ramené ce pédalier multi-effets pour guitare electrique?"})
group.items.append({"id": "n4", "content": "Ce soir, tu dors dehors si ça continue."})
group.items.append({"id": R, "content": "Tortues ninja, ça suffit maintenant!"})

# shuffle the items
random.shuffle(group.items)
==

title=Écoute attentive d'un clip audio

text==#|markdown|
On entend Madame Borie ouvrir une porte puis dire quelque chose durant ce clip 
audio. Mais que dit madame Borie exactement ? 

<br>

<center>
<div>
<img src="{{ url_phot }}" style="width:40%" alt="les instruments de musiques de l'enfer"/><br>
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


