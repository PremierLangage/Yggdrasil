extends = /AAAA/Antonin/stats.pl
# ===============================================
# Documentation Loading
evaluation =@ ../docs/checkbox/evaluation.md
options =@ ../docs/checkbox/options.md
summary =@ ../docs/checkbox/summary.md
user_manual =@ ../docs/checkbox/user_manual.md
# ===============================================

title= Dummy Title CheckboxSurvey

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

# Role : Traitement donnée, 
# - doit remplir la variable globale : data
# - doit remplir la variable globale : answers_csv
# Format spécifié dans le fichier stats.pl
before==#|python|
from database_utils import get_session, Base, CheckboxResponse
import json

inputValues = {k[len("question_"):] : {"question": v, "items": [] for k, v in globals().items() if k.startswith("question_")} 
for k, v in globals().items() if k.startswith("items_"):
    k = k[len("items_"):]
    if k in inputValues:
        inputValues[k]["items"] = v.splitlines()

questions = inputValues.keys()
number_questions = len(questions)
data = {}
answers_csv = f"username,firsname,lastname,email,{','.join([','.join([inputValues[key]['question']] + inputValues[key]['items'])])}\\n"

checkBoxs = []
for key in inputValues:
    tmp = CheckboxGroup(cid=str(i))
    tmp.items() = [{"id": f"item_{key}_{i}",  "content": i} for i in inputValues[key]["items"]]
    checkBoxs.append(tmp)
==

