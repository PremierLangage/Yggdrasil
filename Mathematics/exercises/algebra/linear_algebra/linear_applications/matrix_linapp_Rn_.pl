extends = /model/mathimatrix.pl

before ==
n = 3
m = 2

lstvar = ",".join(["x","y","z","t","u","v"][:n])

A = rand_int_matrix_fullrank(n, m, 3)
B=zeros(nbeq, 1)
sys_tex = latexsys(A, B)
==

text ==
On considère l'application linéaire $! f : \mathbb{R}^{{n}} \rightarrow \mathbb{R}^{{n}} !$ telle que
$$ f({{lstvar}} = ( {{sys_tex}} .$$
Déterminer une base de ce sous-espace (écrire cette base comme un ensemble, entre accolades).
==

evaluator ==
def evalans(strans):
    try:
        ans = latex2sympy(input.value)
        M = Matrix(ans).transpose()
    except:
        return (-1, "La réponse doit être un ensemble de vecteurs de $! \mathbb{R}^{ %s } !$" % n )
    if M.shape[0] != n:
        return (-1, "La réponse doit être un ensemble de vecteurs de $! \mathbb{R}^{ %s } !$" % n )
    if (A*M).norm() != 0:
        return (0, "Cette famille n'est pas une base du sous-espace. Ce n'est même pas une famille de vecteurs du sous-espace.")
    if M.rank() < M.shape[1]:
        return (0, "Cette famille n'est pas une base du sous-espace. Elle n'est pas libre.")
    if M.rank() < m:
        return (0, "Cette famille n'est pas une base du sous-espace. Elle n'est pas génératrice.")
    return (100, "")

score, feedback = evalans(input.value)
==


