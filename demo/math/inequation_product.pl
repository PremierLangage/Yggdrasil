extends = /model/mathinput.pl

title = Inéquation produit

input.virtualKeyboards = sets

before ==
var('x')
a, b = list_randint_norep(2, -6, 6, [0])
expr = (x + a) * (x + b)

ineq = randitem([expr >= 0, expr > 0, expr <= 0,expr < 0])

sol = solveset(ineq, x, domain=S.Reals)
==

text ==
Déterminer l'ensemble des réels $! x !$ tels que $$ {{ineq|latex}}. $$ Ecrire cet ensemble sous la forme d'un intervalle ou d'une réunion d'intervalles.
==

evaluator ==
score, error =  eval_rset(input.value, sol)
feedback = message[error]
==

solution ==
La solution est $! {{sol|latex}} !$.
==


