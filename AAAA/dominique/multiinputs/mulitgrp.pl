
@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ debug_before.py

group =: CheckboxGroup
group2 =: CheckboxGroup
# GENERATE A RANDOM QUESTION
before==
import random

inputs = []
for i in range(3):
    globals()[f"input{i}"] = CheckboxGroup()
    globals()[f"input{i}"].items = list()
    globals()[f"input{i}"].horizontal = True

    for X in ["True","False","Error"]:
        globals()[f"input{i}"].items.append({
            "id": str(X),
            "content": str(X)
        })

    inputs.append({
        "selector": globals()[f"input{i}"].selector,
        "cid": globals()[f"input{i}"].cid
    })

enonce=["Q1","Q2","Q3"]
res = ["True","False","Error"]

==

title = Checkbox Group Component

text==
Select even numbers.
==

form== #|html|
<!--Nombre d'essais : {{essai}}-->
<ol>
{% for i in inputs %}
<!--{% if not solved[loop.index0]%}-->
<li>  {{enonce[loop.index0]}} = {{i|component}}</li>
<!--{% endif %}-->
{% endfor %}
</ol>

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
