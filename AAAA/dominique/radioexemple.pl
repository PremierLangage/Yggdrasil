
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


group.items = []
for prop in propositions.split("\n"):
    group.items.append({
        "id": str(prop), # generate a random id instead of an hardcoded to avoid cheat
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
score = -1
feedback = '<span class="error-state animated pulse infinite">Réponse obligatoire !</span>'

for item in group.items:
    if item['id'] == group.selection:
            score = 100
            feedback = item['content']

grade = (score, feedback)
==
