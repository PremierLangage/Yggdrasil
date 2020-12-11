@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

graph =: MathDrawer

graph.script ==
const grid = board.create('grid', [], {gridX: 1, gridY:1});
const Ox = board.create('axis', [[0, 0], [6, 0]], {ticks: {visible: true}});
const Oy = board.create('axis', [[0, 0], [0, 6]], {ticks: {visible: true}});
const circle = board.create('circle', [[0, 0], [0, 1]], {strokeColor: 'blue', fixed: true});
const O = board.create('point', [0, 0], {size: 1, name: 'O', color: 'black', fixed: true});
const A = board.create('point', [1, 0], {size: 1, name: 'A', color: 'black', fixed: true});
const M = board.create('glider', [1, 1, circle], {size: 2, name: 'M', color: 'red'});
const secOAM = board.create('sector', [O, A, M], {color: 'orange'});
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


