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

author=Nicolas Borie

tag=vidéo|observation|simple|humour

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

title=Reprise d'un tube gigantesque

text==
Un artiste, souhaitant rester anonyme, vous propose le clip suivant
dans lequel il propose une reprise d'une chanson d'une profondeur poignante. 
Selectionnez-donc le titre et l'auteur original de cette oeuvre magistrale.

<br>

<video controls><source src="{{ url_clip }}" type="video/MP4"></video>

==

form==
<style>
.error-state{
   padding: 10px;
}
.success-state{
   padding: 10px;
}
</style>

{{ inputbox|component}}
==

evaluator==#|python|
if 2 == int(inputbox.value):
    grade = (100, '''<span class="success-state">Mais oui, c'est clair!</span> <br> <br>''')
else:
    grade = (0, '''<span class="error-state">Regardez mieux! Le chat, c'est celui qui a le plus de poil...</span> <br> <br>''')
==


