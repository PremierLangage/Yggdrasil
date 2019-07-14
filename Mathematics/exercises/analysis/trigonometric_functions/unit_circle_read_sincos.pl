extends =  unit_circle_read_.pl



text ==
Déterminer le sinus et le cosinus de l'angle $% (\overrightarrow{OA},\overrightarrow{OM}) %$ représenté ci-dessous. 
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
score,_,feedback=ans_real(answer['1'],sol)
==

