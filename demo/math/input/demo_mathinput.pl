extends = /model/math/input.pl

question ==
Entrer une expression mathématique.
==

evaluator ==
score = -1
feedback = "aa" + answers['math']
solution = answers['math']
==

embed ==
# x + 1 #
==