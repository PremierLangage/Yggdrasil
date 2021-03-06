extends = /model/mathinput.pl

title = Relation de dépendance entre polynômes

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

var('X')
A = rand_int_matrix_givenrank(3, 4, 2, magnitude=2)
PX = latex(Poly(tuple(A.row(0)),X))
QX = latex(Poly(tuple(A.row(1)),X))
RX = latex(Poly(tuple(A.row(2)),X))
==

text ==
On se place dans le $!\mathbb{R}!$-espace vectoriel des polynôômes. On considère les polynômes :
$$ P(X) = {{PX}}, Q(X) = {{QX}} \text{ et } R(X) = {{RX}}.$$
Ces vecteurs sont liés. Déterminer une combinaison linéaire (à coefficients non tous nuls) de ces polynômes qui est égale au polynôme nul.

*Note : la réponse attendue est du type $! 2P -Q +3R !$.*
==


evaluator ==
def evalans(strans):
    try:
        ans = Poly(simplify(latex2sympy(strans)), P, Q, R)
    except:
        return (-1,"NotExpr","Votre réponse n'est pas une combinaison linéaire de $!P!$, $!Q!$ et $!R!$.")
    if not ans.is_linear:
        return (-1,"NotLin","Votre réponse n'est pas une combinaison linéaire de $!P!$, $!Q!$ et $!R!$.")
    if Matrix([ans.coeff_monomial(P),ans.coeff_monomial(Q),ans.coeff_monomial(R)]).norm() == 0.:
        return (-1,"AllCoeffZero","Tous les coefficients de cette combinaison linéaire sont nuls.")
    if (Matrix([ans.coeff_monomial(P),ans.coeff_monomial(Q),ans.coeff_monomial(R)]).transpose()*A).norm() != 0.:
        return (0,"NotZero","Cette combinaison linéaire n'est pas égale au polynôme nul.")
    return (100,"","")


var('P Q R')
score, _, feedback = evalans(input.value)

==

