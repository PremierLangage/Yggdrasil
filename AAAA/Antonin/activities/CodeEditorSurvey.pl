extends = /AAAA/Antonin/stats.pl

title= Dummy Title RadioSurvey

text==
TODO # Enonce / Tutoriel d'utilisation d'un RadioSurvey
==

editor =: CodeEditor
editor.theme = dark
editor.language = python
editor.code ==
# write your code here
==

before==#|python|
from database_utils import get_session, Base, RadioResponse


==

formstudent==#|html|
{{ editor|component }}
==
