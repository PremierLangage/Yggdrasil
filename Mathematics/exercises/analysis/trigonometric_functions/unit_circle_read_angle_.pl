extends =  jxg_angle_unit_circle.pl
extends =  /model/mathinput.pl

title = Lire un angle sur le cercle trigonométrique

text ==
Quelle est la mesure (en radians) de l'angle $% (\overrightarrow{OA},\overrightarrow{OM}) %$ représenté ci-dessous. 
{{ jxg|component }}
==

evaluator ==
score, error = eval_expr(input.value, angle, modulo=2*pi)
feedback = feedback_message[error]
==

solution ==
La mesure de l'angle est $! \displaystyle {{angle|latex}} !$.
==






