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
    "content": "Les feux de position"
    })

group.items.append({
    "id": "croisement",
    "content": "Les feux de croisement"
    })

group.items.append({
    "id": "route",
    "content": "Les feux de route"
    })

group.items.append({
    "id": "bav",
    "content": "Les feux de brouillard avant"
    })

group.items.append({
    "id": "barr",
    "content": "Les feux de brouillard arrière"
    })

group.items.append({
    "id": "detresse",
    "content": "Les feux de détresse"
    })
==

title = Code de la route
author = Nicolas Borie

text==

<p style="font-size:1em;">Étant données les conditions de conduite, quels feux les véhicules doivent-ils utiliser ?</p>

<br>

<video controls><source src="{{ url_clip }}" type="video/MP4"></video>

==

form==
{{ group|component }}
==

evaluator==#|python|
right = 0
total = 0
for item in group.items:
    checked = item['checked']
    id = item['id']
    if id in ["veilleuse"]:
        total += 1
        item['css'] = 'success-border animated pulse infinite'
        if checked:
            right += 1
            item['css'] = 'success-border'
    elif checked:
        item['css'] = 'error-border'


if total == 0:
    grade = (100, 'Bonnes réponses !')
else:
    grade = ((right / total) * 100, f"{right} réponses correctes / {total}")
==


