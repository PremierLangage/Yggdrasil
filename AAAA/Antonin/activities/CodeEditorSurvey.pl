extends = /AAAA/Antonin/stats.pl

grader  =@ /grader/evaluator.py


title= Dummy Title CodeEditorSurvey

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
from database_utils import get_session, Base, CodeEditorResponse
import json, sys
if user__role == "teacher":
    labels = []
    data = {"grade": [labels, []]}

    with get_session(table_class=CodeEditorResponse, base=Base) as session:
        answers = session.query(CodeEditorResponse.score).all()
    
    for answer in answers:
        data["grade"][1].append(answer[0]) # mapping row -> int
    [data["grade"][0].append(x) for x in data["grade"][1] if x not in data["grade"][0]]


    globals()["data"] = data
==

formstudent==#|html|
{{ editor|component }}
==

evaluator==#|py|
from database_utils import get_session, Base, CodeEditorResponse
score = 100
feedback = '<span class="success-state">Réponse enregistrée</span>'
if editor.codes[0]['defaultCode'] == editor.code:
    feedback = '<span class="error-state">Vous n\'avez rien saisis, annulation de l\'envois de la réponse</span>'
    score = 0
else:
    if "if" in editor.code:
        score = 100
    else:
        score = 0
    with get_session(table_class = CodeEditorResponse, base=Base) as session:
        session.add(
            CodeEditorResponse(
                student_id  = user__id if user__id else session__id, 
                username    = user__username,
                firstname   = user__firstname,
                lastname    = user__lastname,
                email       = user__email,
                title       = title,
                text        = text,
                grade       = score,
                score       = score
            )
        )
        session.commit()

grade = (score, feedback)
==