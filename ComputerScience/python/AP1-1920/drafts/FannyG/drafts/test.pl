
@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]

title = Radio group
text  = Quelle est la capitale ?
form  = {{ radio|component }}
radio =: RadioGroup

before == #|python|
radio.items = [{"id": "1", "content": "ok"},{"id": "2", "content": "ol"},{"id": "3", "content": "om"}]
==



evaluator == #|python|
grade = (score, radio.items[radio.selection])
==




