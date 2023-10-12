extends = /model/basic/basic.pl

title = Comparaison de nombres (DragDrop)

before==#|python|
from customdragdrop import *

dragdrop = DragDropGroup()
dragdrop.set_drop({"0": ""})
dragdrop.set_label(["habet","hhhhhabent"])
==

text==
Compléter la phrase suivante avec les étiquettes proposées.
==

form ==
Pastor pecuniam non {{  dragdrop.drops['0']|component }}.<br>


{% for label in dragdrop.labels.values() %} {{ label|component }} {% endfor %}
==

#settings.feedback = lightscore

evaluator==#|python|
score = 100
feedback = str(dragdrop.labels['1'])
==

