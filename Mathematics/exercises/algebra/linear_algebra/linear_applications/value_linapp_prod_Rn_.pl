extends = /model/mathinput.pl

title = Valeur d'une application linéaire

before ==
n = 2

lstvar = ",".join(["x","y","z","t","u","v"][:n])


A = rand_int_matrix(n, n, 2)
B = rand_int_matrix(n, n, 2)
X = rand_int_matrix(n, 1, 2)
if randint(1,2) == 1:
    sol = (A * B * X).transpose()
else:
    sol = (B * A * X).transpose()
strsol = str(tuple(sol))
vec = str(tuple(X.transpose()))
==

text ==
Soit les applications linéaires $! f : \mathbb{R}^{{n}} \rightarrow \mathbb{R}^{{n}} !$ et $! g : \mathbb{R}^{{n}} \rightarrow \mathbb{R}^{{n}} !$ dont les matrices par rapport aux bases canoniques des espaces de départ et d'arrivée sont
$$ M_f = \left( {{A.latex}} \right) \quad et \quad M_g = \left( {{B.latex}} \right).$$
Calculer $! {{expr}} {{vec}} !$. Ecrire la réponse sous forme d'un n-uplet (vecteur ligne).
==

evaluator ==
score, _, feedback = eval_tuple(input.value, sol)
==

solution == 
La solution est $! {{strsol}} !$.
==

