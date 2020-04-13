extends = /model/basic.pl

title = Comparaison de nombres (DragDrop)

before==#|python|
from customdragdrop import *

dragdrop = DragDropGroup()
dragdrop.set_drop("")
drops2 = str(dragdrop.drops)
dragdrop.set_label([str(i) for i in range(3)])
labels = dragdrop.labels.values()
==

text==
{{drops2}}
Compléter la phrase suivante avec les étiquettes proposées.
==

form ==
Le {{ drops|component }} est absent.


{% for label in labels %} {{ label|component }} {% endfor %}
==

settings.feedback = lightscore

evaluator==#|python|

==

