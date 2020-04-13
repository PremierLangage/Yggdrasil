extends = /model/basic.pl

title = Comparaison de nombres (DragDrop)

before==#|python|
from customdragdrop import *

drop = CustomDragDrop.Drop()
labels = [CustomDragDrop.Label() for _ in range(3)]
==

text==
Compléter la phrase suivante avec les étiquettes proposées.
==

form==
Le {{ drop|component }} est absent.


{% for label in labels %} {{ label|component }} {% endfor %}
==

settings.feedback = lightscore

evaluator==#|python|

==

