@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: RadioGroup

# GENERATE A RANDOM QUESTION
before==
group.items.append({
    "id": "1",
    "content": "teste"
}
{
    "id": "2",
    "content": "re-teste"
}
{
    "id": "2",
    "content": "re-teste"
}
{
    "id": "2",
    "content": "re-teste"
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

