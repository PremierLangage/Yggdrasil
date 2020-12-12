@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

before==#|python|
import random

fct_list=[]
fct_list.append({"name": "cube", 
                 "formula": "x^{3}",
                 "dom" : [],
                 "codom" : [],})


group.items = []
for i in range(4):
    group.items.append({
        "id": str(i),
        "content": str(random.randint(0, 100))
    })
==

title = Checkbox Group Component

text==
Select even numbers.
==

form==
{{ group|component }}
==

evaluator==


grade = (100, 'Right')
==

