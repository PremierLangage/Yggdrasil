
extends = /AAAA/Antonin/modules/Statistics/stats.pl

# ===============================================
# Documentation Loading
evaluation =@ ../docs/codeEditor/evaluation.md
options =@ ../docs/codeEditor/options.md
summary =@ ../docs/codeEditor/summary.md
user_manual =@ ../docs/codeEditor/user_manual.md
# ===============================================

extends = /AAAA/dominique/A_Presentations/presentation/sondage/correctionTemplate.pl




title= Dummy Title CodeEditorSurvey

text ==#|markdown|
# Documentation:

{{summary}}

---

## Manuel Utilisateur:

{{user_manual}}

---

## Options:

{{options}}

---

## Evaluation

{{evaluation}}

---
==

editor =: CodeEditor
editor.theme = white
editor.language = python
editor.code ==
# write your code here
==


before==#|python|
from database_utils import CodeEditorResponse

globals()["data"] = {}
answers_csv = CsvStringBuilder(["username","firstname","lastname","email","grade"])
with get_session(table_class=CodeEditorResponse, base=Base) as session:

    answers = session.query(CodeEditorResponse).all()
    for answer in answers:
        answers_csv.addLine([answer.username,answer.firstname,answer.lastname,answer.email,answer.grade])
globals()["answers_csv"] = str(answers_csv)
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

if user__username == "drevuz2" :
    # creer un affichage de correction 

    grade = (100,correction)
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
                score       = score,
                feedback    = feedback,
                code        = editor.code
            )
        )
        session.commit()

    grade = (score, feedback+" Merci "+user__username)
==