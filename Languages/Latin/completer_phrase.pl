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
{{drops2}}
Compléter la phrase suivante avec les étiquettes proposées.
==

form ==
Le {{ label0|component }} est absent.


{% for label in labels %} {{ label|component }} {% endfor %}
==

settings.feedback = lightscore

evaluator==#|python|

==

