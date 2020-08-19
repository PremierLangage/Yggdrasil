
@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/qselectbuild.py [builder.py]

title = Radio group
text  = Quelle est la capitale ?
form  == #|python|
{% for rg in radio %} 
    {{ radio|component }}
==
radio =: RadioGroup[]

qselectbuild == #|python|
radio[0].items = [{"id": 1, "content": "ok"},{"id": 2, "content": "ol"},{"id": 3, "content": "om"}]
radio[1].items = [{"id": 1, "content": "ek"},{"id": 2, "content": "el"},{"id": 3, "content": "em"}]
==



evaluator == #|python|
feedback = ""
for d in radio.items : 
    if d["id"] == radio.selection :
        feedback = d["content"]
        break
grade = (100, feedback)
==




