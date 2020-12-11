@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

graph =: MathDrawer

graph.script ==
const grid = board.create('grid', [], {gridX: 1, gridY:1});
const Ox = board.create('axis', [[0, 0], [6, 0]], {ticks: {visible: true}});
const Oy = board.create('axis', [[0, 0], [0, 6]], {ticks: {visible: true}});
const O = board.create('point', [0, 0], {size: 1, color: 'black', fixed: true});
==


group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==#|python|
import random


group.items = []
for i in range(4):
    group.items.append({
        "id": str(i),
        "content": str(random.randint(0, 100))
    })
==

title = Checkbox Group Component

text==#|markdown|
Voici le graphe d'une fonction $% f %$ défini sur l'ensemble fini $% {1, 2, 3, 4, 5} %$

{{ graph|component }}
==


form==
Sélection les propositions correctes avant de valider.

{{ group|component }}
==

evaluator==#|python|

grade = (100, 'Super ce feedback')
==


