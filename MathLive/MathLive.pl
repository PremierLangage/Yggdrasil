@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Démo MathLive

before =

text =

form=@ form_MathLive.html

evaluator ==
ast=eval(answer['1'])
grade=(100,ast['fn'])
==

