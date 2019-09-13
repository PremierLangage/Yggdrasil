extends =  unit_circle_read_.pl

title = Lire un angle sur le cercle trigonométrique

text ==
Quelle est la mesure (en radians) de l'angle $% (\overrightarrow{OA},\overrightarrow{OM}) %$ représenté ci-dessous. 
{{ drawer | component}}
==

evaluator ==
score,_,feedback=ans_expr(input1.value,angle,modulo=2*pi)
==

solution ==
La mesure de l'angle est $! \displaystyle {{angle_tex}} !$.
==





