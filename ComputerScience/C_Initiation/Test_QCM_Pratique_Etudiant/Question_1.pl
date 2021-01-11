@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: RadioGroup

# GENERATE A RANDOM QUESTION
before==
group.items = []
group.items.append({
    "id": "1",
    "content": "teste"
})
group.items.append({
    "id": "2",
    "content": "Re-teste"
})
==

title = Comment percevez-vous Platon ?

text==

==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==

==

