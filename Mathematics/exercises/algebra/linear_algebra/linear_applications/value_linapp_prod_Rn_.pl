extends = /model/mathinput.pl

title = Valeur d'une application linéaire

before ==
n, m, p = 2, 2, 2

lstvar = ",".join(["x","y","z","t","u","v"][:n])


A = rand_int_matrix(n, m, coeffbound)
B = rand_int_matrix(m, p, coeffbound)
X = rand_int_matrix(p, 1, 3)
sol = (A * B * X).transpose()
strsol = str(tuple(sol))
vec = str(tuple(B.transpose()))
expr = ",".join([latex_lincomb(A.row(j),['x','y','z','t']) for j in range(m)])
==

text ==
Soit l'application linéaire $! f : \mathbb{R}^{{n}} \rightarrow \mathbb{R}^{{m}} !$ dont la matrice par rapport aux bases canoniques des espaces de départ et d'arrivée est
$$ M_f = \left( {{A.latex}} \right).$$
Calculer $! f{{vec}} !$. Ecrire la réponse sous forme d'un n-uplet (vecteur ligne).
==

evaluator ==
score, _, feedback = eval_tuple(input.value, sol)
==

solution == 
La solution est $! ({{strsol}}) !$.
==

