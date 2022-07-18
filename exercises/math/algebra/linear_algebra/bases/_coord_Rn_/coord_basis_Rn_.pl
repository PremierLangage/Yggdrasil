extends = /model/math/tuple.pl

before ==
n = param['n']
A = randmat_invertible(n, 2, mindet=0, maxdet=6)

B = randmat(n, 1, 2, [0])

sol = list(linsolve((A, B)))[0]

sys_tex=latexsys(A,B)
basis = str(tuple([tuple(A.col(i)) for i in range(n)]))
vec = str(tuple(B))
==

question ==
On se place dans le $!\mathbb{R}!$-espace vectoriel $! \mathbb{R}^{{n}} !$ et on considère la base 

$$ \mathcal{B} = {{basis}}.$$

Déterminer les coordonnées du vecteur $! {{vec}} !$ dans cette base (écrire les coordonnées sous forme d'un {{tuple_name}} de nombres).
==