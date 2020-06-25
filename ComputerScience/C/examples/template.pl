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
if fonction_eleve(int(data1)) is not bool(expected1):
    nb_bad += 1
if fonction_eleve(int(data2)) is not bool(expected2):
    nb_bad += 1

note = 100 - 50*nb_bad

grade = (note, "Votre note : "+str(note))
==
