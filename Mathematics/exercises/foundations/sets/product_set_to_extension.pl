extends = /model/mathinput.pl

title = Produit cartésien

before ==
lenA, lenB = randitem([[2,3],[3,2],[2,2]])
A = rand_finiteset(lenA,list(range(10)))
B = rand_finiteset(lenB,list(range(10)))
sol = FiniteSet(ProductSet(A,B))
==

text == 
Ecrire en extension l'ensemble $! \\{ {{A|latex}} \\} \times \\{ {{B|latex}} \\}. !$
==

input.virtualKeyboards = sets

evaluator ==
score, error = eval_set(input.value, sol)
feedback = message[error]
==

solution ==
La solution est $! {{sol|latex}} !$.
==





