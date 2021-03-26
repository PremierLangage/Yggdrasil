extends = /model/mathquill.pl

title = Opérations sur les fractions

before ==
lstfrac=[(randitem([1,3,5,7]),2),
(randitem([1,2,4,5,7,8]),3),
(randitem([1,3,5,7]),4),
(randitem([1,2,3,4,6,7,8]),5),
(randitem([1,5,7]),6)]

cf1, cf2 = list_randitem_norep(2, lstfrac)

f1='\\frac{ %d }{ %d }' % (cf1[0],cf1[1])
f2='\\frac{ %d }{ %d }' % (cf2[0],cf2[1])

expr='%s + %s' % (f1, f2)

sol = simplify(latex2sympy(expr))
==

text ==
Calculer l'expression $! \displaystyle {{expr}} !$ en l'écrivant sous la forme d'un entier ou d'une fraction irréductible.
==


evaluator ==
score, error = eval_frac(answers['math'], sol)
feedback = message[error]
==

solution==
La solution est $! \displaystyle {{ sol|latex }} !$.
==
