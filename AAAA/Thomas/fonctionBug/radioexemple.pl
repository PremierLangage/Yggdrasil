
@ /utils/sandboxio.py
grader  =@ /AAAA/dominique/evaluatorwithlog.pl
builder =@ /builder/before.py

group =: RadioGroup


propositions==
c'est bien
c'est cool
c'est top
==



# GENERATE A RANDOM QUESTION
before==
group.items = []
for prop in propositions.split("\n"):
    group.items.append({
        "id": str(prop), # generate a random id instead of an hardcoded to avoid cheat
        "content": str(prop)
    })
==

title = Votre avis

text==
Comment percevez vous la Plateforme PLaTon ? 

==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==

def lafonction():
    return "thomas"


feedback = str(globals())
score = 100




grade = (score, feedback)
==
