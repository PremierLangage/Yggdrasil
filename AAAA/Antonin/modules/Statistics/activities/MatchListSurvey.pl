extends = /AAAA/Antonin/modules/Statistics/stats.pl

# ===============================================
# Documentation Loading
evaluation =@ ../docs/codeEditor/evaluation.md
options =@ ../docs/codeEditor/options.md
summary =@ ../docs/codeEditor/summary.md
user_manual =@ ../docs/codeEditor/user_manual.md
# ===============================================

title= Dummy Title MatchListSurvey

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

match =: MatchList
multiple = False

matches==
test,1
a,2,3
b,1
==

before==#|python|
from database_utils import MatchListResponse
import random
# match component filling:
match.nodes = []
multiple = multiple != "False"
matches_item = {}
for item in [m.split(",") for m in matches.splitlines()]:
    matches_item[item[0]] = item[1:]
left = list(matches_item.keys())
right = list(set([item for sublist in matches_item.values() for item in sublist])) #flatten list
for elem in left:
    match.nodes.append({
        "id": f"source_{hash(elem)}",
        "content": elem,
        "source": True
    })

for elem in right:
    match.nodes.append({
        "id": f"target_{hash(elem)}",
        "content": elem,
        "target": True
    })


# Data filling:
globals()["data"] = {}
answers_csv = CsvStringBuilder(["username","firstname","lastname","email","grade"])
with get_session(table_class=MatchListResponse, base=Base) as session:

    answers = session.query(MatchListResponse).all()
    for answer in answers:
        answers_csv.addLine([answer.username,answer.firstname,answer.lastname,answer.email,answer.grade])
globals()["answers_csv"] = str(answers_csv)
==

formstudent==#|html|
{{ match|component }}
==

evaluator_before==#|py|
from database_utils import get_session, Base, MatchListResponse

# Default Grade intilisation
score = 100
feedback = '<span class="success-state">Réponse enregistrée</span>'
==

# default evaluator dummy
evaluator==#|py|
==

evaluator_after==#|py|
with get_session(table_class = MatchListResponse, base=Base) as session:
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
            feedback    = feedback,
        )
    )
    session.commit()

grade = (score, feedback)
==