
extends = /ComputerScience/python/template/pltest.pl
extends = /AAAA/Antonin/modules/Statistics/stats.pl



@ /AAAA/dominique/pythoneditorsurvey/plteststatsgrader.py [grader.py]


# default evaluator dummy
evaluator==#|py|
==

extends = /AAAA/dominique/A_Presentations/presentation/sondage/correctionTemplate.pl

@ /AAAA/Antonin/modules/Statistics/statbefore.py [builder.py]

stopfirsterror= True
pltest==
>>> prime(1)
1
>>> prime(2)
1 2
>>> prime(3)
1 2 3 
==

title= Test de correction de Code 

text ==#|markdown|

On vous propose d'écrire une fonction prime(N) qui affiche les N premier nombres premiers.



==

editor =: CodeEditor
editor.theme = white
editor.language = python
editor.code ==
# write your code here
==


before==#|python|
from database_utils import CodeEditorResponse
from correction import FeedbackCor
feedback= FeedbackCor()
globals()["data"] = {}
answers_csv = CsvStringBuilder(["username","firstname","lastname","email","grade"])
with get_session(table_class=CodeEditorResponse, base=Base) as session:

    answers = session.query(CodeEditorResponse).all()
    for answer in answers:
        answers_csv.addLine([answer.username,answer.firstname,answer.lastname,answer.email,answer.grade,answer.code])
        feedback.addCopie(answer.username,answer.code,answer.grade)
globals()["answers_csv"] = str(answers_csv)
corhtml = feedback.render()
text += corhtml
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



evaluator_after==#|py|

if user__username == "drevuz2" :
    # creer un affichage de correction 
    grade = (100,corhtml)
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
