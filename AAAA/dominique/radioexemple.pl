
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: RadioGroup


propositions==
c'est bien
c'est cool
c'est top
==



# GENERATE A RANDOM QUESTION
before==
import random
import uuid


R = uuid.uuid4()

group.items = []
for prop in propositions.split("\n"):
    group.items.append({
        "id": uuid.uuid4(), # generate a random id instead of an hardcoded to avoid cheat
        "content": str(prop)
    })



# shuffle the items
random.shuffle(group.items)
==

title = Radio Group Component

text==

comment percevez vous la Plateforme PLaTon ? 


==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==
S = group.selection
score = 0
feedback = '<span class="error-state animated pulse infinite">Bad answer</span>'

for item in group.items:
    item['css'] = ''
    if item['id'] == S:
        if S == R:
            item['css'] = 'success-border'
            score = 100
            feedback = '<span class="success-state animated pulse infinite">Good answer</span>'
        else:
            item['css'] = 'error-border'
    elif item['id'] == R:
        item['css'] = 'success-border animated pulse infinite'

grade = (score, feedback)
==
