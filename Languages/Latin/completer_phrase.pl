extends = /model/basic.pl

title = Comparaison de nombres (DragDrop)

before==#|python|
from customdragdrop import *

dragdrop = DragDropGroup()
dragdrop.set_drop("")
drops = dragdrop.drops

==

text==
{{labels}}
Compléter la phrase suivante avec les étiquettes proposées.
==

form==
Le {{ drops[0]|component }} est absent.


{% for label in labels %} {{ label|component }} {% endfor %}
==

settings.feedback = lightscore

evaluator==#|python|

==

