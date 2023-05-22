extends = /AAAA/Antonin/stats.pl

title= Dummy Title CodeEditorSurvey

text==#|markdown|
Ici vous pouvez définir une activité de **CodeEditor** incluant le module de Statistique :
==

editor =: CodeEditor
editor.theme = dark
editor.language = python
editor.code ==
# write your code here
==


before==#|python|
from database_utils import get_session, Base, CodeEditorResponse
from sqlalchemy import text
import json, sys
from collections import Counter

if user__role == "teacher":
    data = {"grade": [[], []], "tryAmount": [[], []]}

    with get_session(table_class=CodeEditorResponse, base=Base) as session:
        answers = session.query(CodeEditorResponse.score).all()
    
    for answer in answers:
        data["grade"][1].append(answer[0]) # mapping row -> int
    [data["grade"][0].append(x) for x in data["grade"][1] if x not in data["grade"][0]]
    data["grade"][0].sort()

    with get_session(table_class=CodeEditorResponse, base=Base) as session:
        answers = session.query(CodeEditorResponse.student_id).all()
    print(Counter(answers).values(), file=sys.stderr)
    for answer in Counter(answers).values():
        data["tryAmount"][1].append(answer[0]) # mapping row -> int
    [data["tryAmount"][0].append(x) for x in data["tryAmount"][1] if x not in data["tryAmount"][0]]
    data["tryAmount"][0].sort()

    globals()["data"] = data
==

formstudent==#|html|
{{ editor|component }}
==

evaluator_before==#|py|
from database_utils import get_session, Base, CodeEditorResponse

# Default Grade intilisation
score = 100
feedback = '<span class="success-state">Réponse enregistrée</span>'
==

# default evaluator dummy
evaluator==#|py|
==

evaluator_after==#|py|
if editor.codes[0]['defaultCode'] == editor.code:
    feedback = '<span class="error-state">Vous n\'avez rien saisis, annulation de l\'envois de la réponse</span>'
    score = -1
else:
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