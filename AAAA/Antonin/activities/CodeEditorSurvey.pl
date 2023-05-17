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
"""    data["grade"][1] = list(map(lambda x : x['_data'][0], answers))
    [data["grade"][0].append(x) for x in data["grade"][1] if x not in data["grade"][0]]
    globals()["data"] = data"""
==

formstudent==#|html|
{{ answers }}
{{ editor|component }}
==

evaluator==#|py|

if "if" in editor.code:
    grade = (100, f"student code:\n{editor.code}")
else:
    grade=(0," non vous n'avez pas répondu a la question")


==