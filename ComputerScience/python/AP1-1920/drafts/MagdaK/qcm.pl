
@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==
import random
group.items = []
for i,p in enumerate(propvraie):
    group.items.append({
        "id": str(i),
        "content": p
    })
group.items = []
propvraie = ['vraie','true',"True"]
for i,p in enumerate(propvraie):
    group.items.append({
        "id": str(i),
        "content": p,
        "_correct": True
    })
propfalse=['non',"faux","pas vrai"]
for i,p in enumerate(propfalse):
    group.items.append({
        "id": str(i),
        "content": p,
        "_correct": False
    })



==

title = Checkbox Group Component

text==
Select even numbers.
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==
right = 0
total = 0
for item in group.items:
    checked = item['checked']
    content = int(item['content'])
    vraie=bool(item['_correct'])
    if content % 2 == 0:
        total += 1
        item['css'] = 'success-border animated pulse infinite'
        if checked:
            right += 1
            item['css'] = 'success-border'
    elif checked:
        item['css'] = 'error-border'


if total == 0:
    grade = (100, 'Right')
else:
    grade = ((right / total) * 100, f"{right} / {total}")
==

