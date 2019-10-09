@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==
import random

group.items.append({"id": "1", "content": "Langage compilé"})
group.items.append({"id": "2", "content": "Langage interprété"})
group.items.append({"id": "3", "content": "Langage typé dynamiquement"})
group.items.append({"id": "4", "content": "Langage typé statiquement"})
group.items.append({"id": "5", "content": "Langage non typé"})
group.items.append({"id": "6", "content": "Langage Orienté objet"})
group.items.append({"id": "7", "content": "Langage Impératif"})
group.items.append({"id": "8", "content": "Langage haut niveau"})
group.items.append({"id": "9", "content": "Langage bas niveau"})

==

title = Checkbox Group Component

text==
Sélectionnez les caractéristiques du Langage C
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
    if content % 2 == 0:
        total += 1
        item['css'] = 'error-state'
        if checked:
            right += 1
            item['css'] = 'success-state'
    elif checked:
        item['css'] = 'error-state'


grade = (right / total, f"{right} / {total}")
==


