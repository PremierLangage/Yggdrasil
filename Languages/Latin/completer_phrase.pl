extends = /model/basic.pl

title = Comparaison de nombres (DragDrop)

before==#|python|
from customdragdrop import *

dragdrop = DragDropGroup()
dragdrop.set_drop("")
dragdrop.set_label({"lt": "1", "gt": '3'})
labels = [1,2]
==

text==
Compléter la phrase suivante avec les étiquettes proposées.
==

form ==
{% for label in labels %} {{ label|component }} {% endfor %}
==

settings.feedback = lightscore

evaluator==#|python|

==

