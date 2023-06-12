
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

reveal =: RevealViewer
reveal.content =@ slide.md


title = Présentation

text= 

before==#|python|

==


form==
{{ reveal|component }}
==
