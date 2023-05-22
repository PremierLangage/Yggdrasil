extends = /AAAA/Antonin/activities/CodeEditorSurvey.pl

title= Dummy Title CodeEditorResponse

text==
TODO # Enonce / Tutoriel d'utilisation d'un RadioSurvey
==

editor.theme = dark
editor.language = python
editor.code ==
# write your code here
==

evaluator==#|py|
if "if" in editor.code:
    grade = (100, f"student code:\n{editor.code}")
else:
    grade=(0," non vous n'avez pas répondu a la question")
==