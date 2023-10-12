@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group1 =: CheckboxGroup
group2 =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==#|py|
import random

group1.horizontal = True
group1.items = []
for i in range(4):
    group1.items.append({
        "id": str(i),
        "content": str(i)
    })

group2.horizontal = True
group2.items = []
for i in range(4):
    group2.items.append({
        "id": str(i+4),
        "content": str(i+4)
    })
==

title = CYK

text==#|markdown|
**Pair ?**
{{ group1|component }}

** Pair aussi ? **
{{ group2|component }}
==

form==

==

evaluator==#|py|
right = 0
total = 0
for item in group1.items:
    total += 1
    checked = item['checked']
    content = item['content']
    if int(content) % 2 == 0:
        item['css'] = 'success-border animated pulse infinite'
        if checked:
            right += 1
            item['css'] = 'success-border'
    elif checked:
        item['css'] = 'error-border'
    else:
        right += 1

for item in group2.items:
    total += 1
    checked = item['checked']
    content = item['content']
    if int(content) % 2 == 0:
        item['css'] = 'success-border animated pulse infinite'
        if checked:
            right += 1
            item['css'] = 'success-border'
    elif checked:
        item['css'] = 'error-border'
    else:
        right += 1

grade = ((right / total) * 100, f'{right} / {total}')
==

settings.allow_reroll = true