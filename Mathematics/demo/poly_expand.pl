extends = /model/mathinput.pl

title = Développement

before ==

==

text ==
Développer $$ {{ expr|latex }}.$$
==

evaluator ==
score, error = eval_poly(input.value, sol, var="x", form="expanded")
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==
