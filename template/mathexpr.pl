@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /input/mathexpr/template.html [mathexpr_template.html]
@ /input/mathexpr/head.html [mathexpr_head.html]

title = Champ de réponse mathexpr

lang = fr

text ==
Calculer $% 3+5 %$.
==

form ==
{{input_1}}
==

input.1.type = mathexpr
input.1.style = width:100%
input.1.virtualKeyboards = elementary
input.1.virtualKeyboardMode = manual

evaluator ==
if answer['1']=="8":
    score=100
else:
    score=0
==



