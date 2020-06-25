editor =: CodeEditor
editor.theme = dark
editor.language = python
editor.code ==
def fonction_eleve(...): 
    # write your code here
==

form==
{{ editor|component }}
==

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py

evaluator==#|python|
exec(editor.code)

nb_bad = 0
if fonction_eleve(int(data1)) is not bool(expexted1):
    nb_bad += 1
if fonction_eleve(int(data2)) is not bool(expexted2):
    nb_bad += 1

grade = (100 - 50*nb_bad, "On pourrait mettre du feedback ici...")
==
