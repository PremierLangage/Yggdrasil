extends = /model/basic.pl

title = Comparaison de nombres (DragDrop)

before==#|python|
from customdragdrop import *

dragdrop = DragDropGroup()
dragdrop.set_drop("")
dragdrop.set_label(["1","3"])
labels = list(dragdrop.labels.values())
==

text==
Compléter la phrase suivante avec les étiquettes proposées.
==

form ==
{% for label in dragdrop['labels'] %} {{ label|component }} {% endfor %}
==

settings.feedback = lightscore

evaluator==#|python|

==

