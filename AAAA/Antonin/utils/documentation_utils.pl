@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

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

title= Documentation_Utils
text= {{documentation}}
form= None


before==#|python|
==