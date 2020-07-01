@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Addition

before ==
a = 1
b = 2
==

text ==
$! \frac{ {{a}} }{ {{b}} } !$
==

form ==
==

evaluator ==
grade = (100, "")
==





