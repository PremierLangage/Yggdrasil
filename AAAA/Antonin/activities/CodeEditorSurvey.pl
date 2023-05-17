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
from database_utils import get_session, Base, Response

if user__role == "teacher":
    labels = []
    data = {"grade": [labels, []]}

    with get_session(table_class=Response, base=Base) as session:
        answers = session.query(Response.grade).all()
==

formstudent==#|html|
{{ editor|component }}
==
