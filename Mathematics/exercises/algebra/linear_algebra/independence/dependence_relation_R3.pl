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
def evalans(strans):
    try:
        ans = Poly(simplify(latex2sympy(strans)), u, v, w)
    except:
        return (-1,"NotExpr","Votre réponse n'est pas une combinaison linéaire de $u!$ $!v!$ et $!w!$.")
    if not ans.is_linear():
        return (-1,"NotLin","Votre réponse n'est pas une combinaison linéaire de $u!$ $!v!$ et $!w!$.")
    return (100,"NotPoly",str(Matrix([ans.coeff_monomial(u),ans.coeff_monomial(v),ans.coeff_monomial(w)]).transpose()*A)
)

var('u v w')
score, _, feedback = evalans(input.value)

==

