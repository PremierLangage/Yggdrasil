@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

url_clip =$ platon_code_route.mp4

# GENERATE A RANDOM QUESTION
before==#|python|
group.items = []

group.items.append({
    "id": "veilleuse",
    "content": "veilleuses"
    })
==

title = Checkbox Group Component

text==

Étant donné les conditions de conduite, quels feux les véhicules doivent-ils utiliser ?

<video controls><source src="{{ url_clip }}" type="video/MP4"></video>

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


