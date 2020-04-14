extends = /model/basic.pl

title = Comparaison de nombres (DragDrop)

before==#|python|
from customdragdrop import *

dragdrop = DragDropGroup()
dragdrop.set_drop({"0": ""})
dragdrop.set_label(["1","3"])
==

text==
Compléter la phrase suivante avec les étiquettes proposées.
==

form ==
Phrase {{  dragdrop.drops['0']|component }} à compléter.
{% for label in dragdrop.labels.values() %} {{ label|component }} {% endfor %}
==

#settings.feedback = lightscore

evaluator==#|python|
score = 100
feedback = str(dragdrop.labels['1'])
==

