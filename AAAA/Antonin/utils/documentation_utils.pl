@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py



summary==#|markdown|
Summary
==
user_manual==#|markdown|
Manual
==
options==#|markdown|
options
==
evaluation==#|markdown|
evaluation
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

{{evaluation}}


==

title= Documentation_Utils
text= {{documentation}}
form= None


before==#|python|
==