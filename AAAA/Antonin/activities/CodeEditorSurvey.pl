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

__save_editor_code = editor.code

before==#|python|
from database_utils import get_session, Base, Response

if user__role == "teacher":
    labels = []
    data = {"grade": [labels, []]}

    with get_session(table_class=Response, base=Base) as session:
        answers = session.query(Response.grade).all()
    
    for answer in answers:
        for k, v in json.loads(str(answer[0])).items():
            data["grade"][1].append(k)
    [data["grade"][0].append(x) for x in data["grade"][1] if x not in data["grade"][0]]
    globals()["data"] = data
==

formstudent==#|html|
{{ answers }}
{{ data }}
{{ editor|component }}
==

evaluator==#|py|
from database_utils import get_session, Base, Response
import json

score = 100
feedback = '<span class="success-state">Réponse enregistrée</span>'
if __save_editor_code == editor.code:

if "if" in editor.code:
    score = 100
    with get_session(table_class = Response, base=Base) as session:
        session.add(
            Response(
                student_id = user__id if user__id else session__id, 
                username    = user__username,
                firstname   = user__firstname,
                lastname    = user__lastname,
                email       = user__email,
                title       = title,
                text        = text,
                grade       = score,
        session.commit()
else:
    feedback = '<span class="error-state">Vous n\'avez rien saisis, annulation de l\'envois de la réponse</span>'
    score = 0

grade = (score, feedback)
==