@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = markdown
editor.code ==
# write your code here
==


selectable =: Text
selectable.text = The quick brown fox jumps over the lazy dog.
selectable.mode = word



before==
==

title = Code Editor Component

text==
==

form==
{{ editor|component }}
==

evaluator==
selectable.separator=' '
state=1
if state==1:
    text = "Sélectionnez les mots valides " 
    form="{{ selectable|component}}"

selectable.text = editor.code

grade = (100, f"student code:\n{editor.code}")
==


