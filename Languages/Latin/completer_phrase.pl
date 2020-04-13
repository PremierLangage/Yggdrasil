extends = /model/basic.pl

title = Comparaison de nombres (DragDrop)

before==#|python|
from customdragdrop import *

dragdrop = DragDropGroup()
dragdrop.set_drop("")
dragdrop.set_label([str(i) for i in range(3)])
label0 = dragdrop.labels[0]
==

text==
Compléter la phrase suivante avec les étiquettes proposées.
==

form ==
Le {{ label0|component }} est absent.
==

settings.feedback = lightscore

evaluator==#|python|
{% for label in labels %} {{ label|component }} {% endfor %}

==

