extends =  unit_circle_read_.pl



text ==
Quelle est la mesure (en radians) de l'angle $% (\overrightarrow{OA},\overrightarrow{OM}) %$ représenté ci-dessous. 
==

form ==
{{input_1 | safe}}
<br>
{{input_2 | safe}}
==

input.2.type = mathexpr
input.2.virtualKeyboardMode = manual
input.2.virtualKeyboards = elementary

evaluator ==
score,_,feedback=ans_expr(answer['2'],angle)
==

