
extends = /AAAA/Thomas/Sondage-06-07-2023/stats.pl

extends = /AAAA/Thomas/Sondage-06-07-2023/codeCorrection/correctionEmptyTemplate.pl

title= Sondage

teacher_name=revuz

text ==#|markdown|
==

editor =: CodeEditor
editor.theme = white
editor.language = plaintext
editor.code ==
Écrivez votre question ici
==

before==#|python|
if user__lastname.lower() == teacher_name:
    from database_utils import CodeEditorResponse
    from correction import FeedbackCor
    _feedback= FeedbackCor()
    globals()["data"] = {}
    answers_csv = CsvStringBuilder(["username","firstname","lastname","email","grade"])
    with get_session(table_class=CodeEditorResponse, base=Base) as session:

        answers = session.query(CodeEditorResponse).all()
        for answer in answers:
            answers_csv.addLine([answer.username,answer.firstname,answer.lastname,answer.email,answer.grade,answer.code])
            _feedback.addCopie(answer.firstname, answer.lastname, answer.username,answer.code,answer.grade, answer.checked)
    globals()["answers_csv"] = str(answers_csv)
    corhtml = _feedback.render()
    text += corhtml
==

formstudent==#|html|
{{ editor|component }}
==

evaluator_before==#|py|
from database_utils import get_session, Base, CodeEditorResponse, Response

# Default Grade intilisation
score = 100
feedback = '<span class="success-state">Réponse enregistrée</span>'
==

# default evaluator dummy
evaluator==#|py|
==

evaluator_after==#|py|
from correction import FeedbackCor

if user__lastname.lower() == teacher_name :
    grade = (score,"")
    # creer un affichage de correction 
    with get_session(table_class = CodeEditorResponse, base=Base) as session:
        users = [x for x in _feedback['copies']]
        modified_copies = [(k, v) for k, v in response.items() if k in users] # on filtre les response qui ne correspondent pas a un utilisateur
        for user, checked in modified_copies:
            for i in session.query(CodeEditorResponse).all():
                if i.username == user:
                    i.checked = checked
        session.commit()
        text = "<script>location.reload();</script>"
else:
    with get_session(table_class = CodeEditorResponse, base=Base) as session:
        session.add(
            CodeEditorResponse(
                student_id  = user__id if user__id else session__id, 
                username    = user__username if user__id else user__username + "_" + str(session__id),
                firstname   = user__firstname,
                lastname    = user__lastname,
                email       = user__email,
                title       = title,
                text        = text,
                grade       = score,
                score       = score,
                feedback    = feedback,
                code        = editor.code,
                checked     = -1
            )
        )
        session.commit()

    grade = (score, feedback+" Merci "+ f"{user__firstname} {user__lastname} #" + (user__username if user__id else user__username + "_" + str(session__id)))
==
