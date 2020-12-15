
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = python
editor.code ==
# write your code here
==

before==
==

title = Code Editor Component

text==
Quel mot clef permet un branchement en python ?
==

form==
{{ editor|component }}
==

evaluator==

if "if in editor.code:
    grade = (100, f"student code:\n{editor.code}")
else:
    grade=(0," non vous n'avez pas répondu a la question")


==
