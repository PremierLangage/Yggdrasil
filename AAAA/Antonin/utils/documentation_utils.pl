@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title= Documentation_Utils
text= None
form= None

summary==#|markdown|
==
user_manual==#|markdown|
==
options==#|markdown|
==
evaluation==#|markdown|
==

documentation==#|markdown|
# Documentation:

{{summary}}

---

# Manuel Utilisateur:

{{user_manual}}

---

# Options:

{{options}}

---

# Evaluation:

{{options}}


==

before==#|python|
==