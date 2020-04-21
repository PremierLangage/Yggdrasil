extends = /model/mathinput.pl

title = Valeur d'une application linéaire

before ==
n, m = rd.choice(param['sizes'])

lstvar = ",".join(["x","y","z","t","u","v"][:n])


A = rand_int_matrix_fullrank(m, n, 3)
B = rand_int_matrix(n, 1, 3)
vec = tuple(B.transpose())
expr = ",".join([latex_lincomb(A.row(j),['x','y','z','t']) for j in range(m)])
==

text ==
Soit l'application linéaire $! f : \mathbb{R}^{{n}} \rightarrow \mathbb{R}^{{m}} !$ dont la matrice par rapport aux bases canoniques des espaces de départ et d'arrivée est
$$ M_f = \left( {{A.latex}} \right).$$
Calculer $! f{{vec.latex}} !$. Ecrire la réponse sous forme d'un n-uplet (vecteur ligne).
==

evaluator ==
score, _, feedback = eval_matrix(mat.getmatrix(), A)
==

evaluator ==
score, error, feedback = eval_tuple(input.value, sol, checksize=True)
if error == "NotTuple" or error == "WrongSize":
    feedback = f"Votre réponse n'est pas un {tuple_name} de nombres."
==

solution == 
La solution est $! {{sol_tex}} !$.
==
