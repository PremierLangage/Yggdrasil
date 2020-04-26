@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Addition

before ==
a=3
==

text ==
{{a}}
==

form ==

==

feedback ==
{{a}}
==

evaluator ==
grade = (score, {{a}})
==



