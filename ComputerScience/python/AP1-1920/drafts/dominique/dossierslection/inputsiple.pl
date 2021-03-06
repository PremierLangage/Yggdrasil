@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = markdown
editor.code ==
# write your code here
==

state  % 0 

selectable =: Text
selectable.text = The quick brown fox jumps over the lazy dog.
selectable.mode = word



before==
==

title = text exercice creator 

text==
==

form==
{{ editor|component }}
==

evaluator==
selectable.separator=' '
state += 1
if state==1:
    text = "Sélectionnez les mots valides " 
    form="{{ selectable|component}}"
    selectable.text = editor.code
    grade = (100, " Choisissez les mots ")
elif state== 2: 
    indices = []
    for e in selectable.selections:
        indices.append(e['index'])
    grade = (100, selectable.text + ";" + str(indices) )
else:
    grade = (100, " ")
==


