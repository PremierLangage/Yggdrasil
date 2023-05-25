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
import json
from database_utils import get_session, Base, RadioResponse

==

