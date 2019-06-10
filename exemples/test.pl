@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Essai de la modification des variables

before==
essai=0
==

text ==
{{essai}}
==

form =

evaluator ==
essai=essai+1
grade=(essai*essai,"")
==






