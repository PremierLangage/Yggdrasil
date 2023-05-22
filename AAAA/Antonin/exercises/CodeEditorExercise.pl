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
    score = 100
elif "else" in editor.code:
    score = 42
else:
    score = 0
==

include_stats_score = True
include_stats_participation = True