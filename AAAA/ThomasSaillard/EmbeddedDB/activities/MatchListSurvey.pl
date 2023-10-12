extends = /AAAA/ThomasSaillard/EmbeddedDB/stats.pl

# ===============================================
# Documentation Loading
evaluation =@ ../docs/matchList/evaluation.md
options =@ ../docs/matchList/options.md
summary =@ ../docs/matchList/summary.md
user_manual =@ ../docs/matchList/user_manual.md
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

matchList =: MatchList

multiple = False

matches==
==

before_post==#|python|
from database_utils import MatchListResponse
import random
# match component filling:
matchList.nodes = []
matchList.links = []
multiple = multiple != "False"
matches_solution = {}
for item in [m.split(",") for m in matches.splitlines()]:
    matches_solution[item[0]] = item[1:]
left = list(matches_solution.keys())
right = list(set([item for sublist in matches_solution.values() for item in sublist])) #flatten list
for elem in left:
    matchList.nodes.append({
        "id": f"source_{elem}",
        "content": elem,
        "source": True,
        "multiple": multiple
    })

for elem in right:
    matchList.nodes.append({
        "id": f"target_{elem}",
        "content": elem,
        "target": True,
        "multiple": multiple
    })

random.shuffle(matchList.nodes)

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
{{ matchList|component }}
==

evaluator_before==#|py|
from database_utils import get_session, Base, MatchListResponse
# Default Grade initialisation
score = 100


def in_links(solution_source, solution_target, links):
    for e in links:
        if e['source'] == f"source_{solution_source}" and  e['target'] == f"target_{solution_target}":
            return 0
    return 1

nombre_erreurs = 0
for k, v in matches_solution.items():
    for t in v:
        nombre_erreurs += in_links(k, t, matchList.links)

feedback = f'<span class="success-state">Réponse enregistrée</span>'
==

# default evaluator dummy
evaluator==#|py|
==

evaluator_after==#|py|
if matchList.links == []:
    feedback = '<span class="error-state">Vous n\'avez rien saisis, annulation de l\'envois de la reponse</span>'
    score = -1
else:
    with get_session(table_class = MatchListResponse, base=Base) as session:
        session.add(
            MatchListResponse(
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