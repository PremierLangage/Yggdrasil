@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
mathexpr_template =@ /input/mathexpr/template.html
mathexpr_process_config =
mathexpr_head =@ /input/mathexpr/head.html
mathexpr_process_answer =

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

