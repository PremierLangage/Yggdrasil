@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

criteria=injective

before==#|python|
import random

fct_list=[]
fct_list.append({"name": "cube", 
                 "formula": "x^{3}",
                 "dom" : ["[0, 2]"],
                 "codom" : ["[0, 8]"],})


group.items = []
for i in range(4):
    group.items.append({
        "id": str(i),
        "content": str(random.randint(0, 100))
    })
==

title=

text==
Select even numbers.
==

form==#|html|
<b>Parmi les fonctions suivantes, selectionnez celles qui sont {{ criteria }}.</b><br>

<i>Attention, tout est possible. Tout peut-être juste et tout peut être faux.</i>

{{ group|component }}
==

evaluator==


grade = (100, 'Right')
==

