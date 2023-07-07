before==
==
extends = /AAAA/Antonin/modules/Statistics/activities/CodeEditorSurvey.pl

@ /ComputerScience/python/template/pltest_doc.py [pltest_doc.py]

extends = /AAAA/dominique/A_Presentations/presentation/sondage/correctionTemplate.pl

@ /AAAA/dominique/pythoneditorsurvey/plteststatsgrader.py [grader.py]


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

before==#|python|
from database_utils import CodeEditorResponse
from correction import FeedbackCor
feedbackCor= FeedbackCor()
globals()["data"] = {}
answers_csv = CsvStringBuilder(["username","firstname","lastname","email","grade"])
with get_session(table_class=CodeEditorResponse, base=Base) as session:

    answers = session.query(CodeEditorResponse).all()
    for answer in answers:
        answers_csv.addLine([answer.username,answer.firstname,answer.lastname,answer.email,answer.grade,answer.code])
        feedbackCor.addCopie(answer.username,answer.code,answer.grade)
globals()["answers_csv"] = str(answers_csv)
corhtml = feedbackCor.render()
text += corhtml 
==
