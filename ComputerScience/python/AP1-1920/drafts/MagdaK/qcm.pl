
@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==
import random
group.items = []
propvraie = [('vraie',"ffed1"),('true',"ffed1"),("True","ffed1")]
i=1
for p,f in random.sample(propvraie,2):
    group.items.append({
        "id": str(i),
        "content": p,
        "_correct": True,
        "_feed":f
    })
    i+=1
propfalse=['non',"faux","pas vrai"]
for p in enumerate(random.sample(propfalse,2)):
    group.items.append({
        "id": str(i),
        "content": p,
        "_correct": False,
        "_feed":"C'est faux"
    })
    i+=1

random.shuffle(group.items)

==

title = Checkbox Group Component

text==
Selectionnez les affioramtions vraies.
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
    vrai=bool(item['_correct'])
    if vrai:
        total += 1
        item['css'] = 'success-border animated pulse infinite'
        if checked:
            right += 1
            item['css'] = 'success-border'

    elif checked:
        item['css'] = 'error-border'

feedback = " ".join([ x['_feed'] for x in group.items])


if total == right:
    grade = (100, 'Just Right ! Bravo !'+feedback)
else:
    grade = ((right / total) * 100, f"{right} / {total}"+feedback)
==

