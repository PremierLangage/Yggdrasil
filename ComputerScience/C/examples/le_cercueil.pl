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

url_phot =$ memes.jpg
url_clip =$ trop_stylax.mp3

author=Nicolas Borie

tag=audio|écoute|simple|humour


# GENERATE A RANDOM QUESTION
before==#|python|
import random

group.items = []
R = 'y1'
group.items.append({"id": "n1", "content": "Big Enough (Kirin J Callinan)"})
group.items.append({"id": "n2", "content": "Epic sax guy"})
group.items.append({"id": "n3", "content": "Troll song (la la la la la...)"})
group.items.append({"id": "n4", "content": "Nyan Cat"})
group.items.append({"id": R, "content": "La chanson du cercueil"})

# shuffle the items
random.shuffle(group.items)
==

title=Know your meme!

text==#|markdown|
Un célèbre groupe de métal flûte propose ici une réinterprétation d'un célèbre
morceau de musique issue d'un même très célèbre sur Internet et Youtube en 
particulier, quel est ce meme ?

<br>

<center>
<div>
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
feedback = '<span class="error-state animated pulse infinite" style="padding: 10px">Non, il faut r&eacute;viser vos classiques...</span>'

for item in group.items:
    item['css'] = ''
    if item['id'] == S:
        if S == R:
            item['css'] = 'success-border'
            score = 100
            feedback = '''<span class="success-state animated pulse infinite" style="padding: 10px">Parfait, vous maitrisez les memes!</span>'''
        else:
            item['css'] = 'error-border'
    elif item['id'] == R:
        item['css'] = 'success-border animated pulse infinite'

grade = (score, feedback)
==


