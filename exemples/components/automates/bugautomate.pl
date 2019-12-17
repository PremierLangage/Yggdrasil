@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py


title = Automaton Editor

editor =: AutomatonEditor
editor.automaton ==
#states
s0
s1
s2
#initials
s0
#accepting
s2
#alphabet
a
b
#transitions
s0:a>s1
s1:a>s1
s1:b>s2

==

before==
==


text==
==

form==
{{ editor|component }}
==

evaluator==
grade = (100, "")
==


