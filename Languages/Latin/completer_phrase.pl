extends = /model/basic.pl

@ /utils/components/dragdrop.py [customdragdrop.py]

title = Comparaison de nombres (DragDrop)

before==#|python|
import random as rd
from customdragdrop import *

drop = CustomDragDrop.Drop()
labels = [CustomDragDrop.Label() for _ in range(3)]
==

text==
Compméter la phrase suivante avec les étiquettes proposées.
==

form==
Le {{ drop|component }} est absent.

{% for label in labels %}
{{ label|component }}
{% endfor %}
==

settings.feedback = lightscore

evaluator==#|python|
from customdragdrop import CustomDragDrop, DragDropGroup, right_minus_wrong

# On récupère les données du before
mygroup = DragDropGroup()
mygroup.labels = {'lt':a, 'gt': b}
mygroup.drops = {0: c0, 1: c1, 2: c2, 3: c3}
mygroup._matches = match

grade=mygroup.eval(grading_function = right_minus_wrong)
==

