@ /utils/sandboxio.py
@ cyk.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group1 =: CheckboxGroup
group2 =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==#|py|
import random

words = good + bad
random.shuffle(words)

group1.items = []
for i in range(4):
    group1.items.append({
        "id": str(i),
        "content": str(i)
    })

group2.items = []
for i in range(4):
    group2.items.append({
        "id": str(i+4),
        "content": str(i+4)
    })
==

title = CYK

text==
Pair ?
==

form==
{{ group1|component }}

{{ group2|component }}
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

grade = ((right / total) * 100, f'{right} / {total}')
==

settings.allow_reroll = true