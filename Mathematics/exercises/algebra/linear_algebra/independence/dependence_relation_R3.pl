extends = /model/mathinput.pl

title = Relation de dépendance entre vecteurs $! \mathbb{R}^4 !$

nbstep % 5

before ==
A = rand_int_matrix_givenrank(3, 4, 3, magnitude=1)
stru = str(tuple(A.row(0)))
strv = str(tuple(A.row(1)))
strw = str(tuple(A.row(2)))
==

text ==
On se place dans le $!\mathbb{R}!$-espace vectoriel $! \mathbb{R}^4 !$. On considère les vecteurs :
$$ u = {{stru}}, v = {{strv}} \text{ et } w = {{strw}}.$$
Ces vecteurs sont liés. Déterminer une combinaison linéaire de ces vecteurs égale au vecteur nul.
==


evaluator ==
var('u v w')
ans = input.value
rel = Poly(3*u-v,u,v,w)
feedback = str(rel.is_linear)

score = 100
==

