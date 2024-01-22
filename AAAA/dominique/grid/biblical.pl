
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# DECLARATION
sortlist =: SortList

sortlist.items %= #|json|
[
    { "id": "", "content": "AU COMMENCEMENT, Dieu créa le ciel et la terre." },
    { "id": "", "content": "La terre était informe et vide, les ténèbres étaient au-dessus de l’abîme et le souffle de Dieu planait au-dessus des eaux." },
    { "id": "", "content": "Dieu dit : « Que la lumière soit. » Et la lumière fut." },
     { "id": "", "content": "Dieu vit que la lumière était bonne, et Dieu sépara la lumière des ténèbres." },
      { "id": "", "content": "Dieu appela la lumière « jour », il appela les ténèbres « nuit ». Il y eut un soir, il y eut un matin : premier jour." },
      { "id": "", "content": "Et Dieu dit : « Qu’il y ait un firmament au milieu des eaux, et qu’il sépare les eaux. »"},
       { "id": "", "content": "Dieu appela le firmament « ciel ». Il y eut un soir, il y eut un matin : deuxième jour."}
]
==



# RANDOMIZATION
before== #|python|
import random
import uuid
answer = []
for e in sortlist.items:
    # generate random id because students can
    # guest the answer if ids like 1, 2, 3 are used
    e["id"] = uuid.uuid4()
    answer.append(e["id"])
random.shuffle(sortlist.items)
==

# FORM
title = Sort List Component
text = *Drag and Drop the items to sort the list*
form = {{ sortlist|component }}


# EVALUATION
evaluator== #|python|
errors = 0
for i, e in enumerate(sortlist.items):
    e['css'] = 'success-state animated fadeIn'
    if e['id'] != answer[i]:
        e['css'] = 'error-state animated fadeIn'
        errors += 1

if errors == 0:
    grade = (100, '<span class="success-state animated pulse infinite">Good answer</span>')
else:
    grade = (0, f'<span class="error-state animated pulse infinite">{ errors } wrong answers</span>')
==
