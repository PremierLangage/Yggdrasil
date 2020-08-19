
@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/qselectbuild.py [builder.py]

title = Radio group
text  = Quelle est la capitale ?
form  = {{ radio|component }}
radio =: RadioGroup

qselectbuild == #|python|
radio.items = [{"id": "1", "content": "ok"},{"id": "2", "content": "ol"},{"id": "3", "content": "om"}]
==



evaluator == #|python|
feedback = ""
for i in radio.items : 
    if radio.items[i]["id"] == radio.selection :
        feedback = radio.items[i]["content"]
        break
grade = (100, feedback)
==




