@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: RadioGroup

# GENERATE A RANDOM QUESTION
before==
group.items = []
group.items.append({
    "id": "1",
    "content": "Comme quelque chose d'imposé par les enseignant"
})
group.items.append({
    "id": "2",
    "content": "C quoi Platon ?"
}
group.items.append({
    "id": "3",
    "content": "Un coach qui permet d'apprendre ?"
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

