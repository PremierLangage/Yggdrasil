extends = /model/math.pl

before ==
keyboards_JSON['virtualKeyboards']="sets"
input.config = keyboards_JSON

n = param['n']
nbeq = param['nbeq']
m = n-nbeq
A=rand_int_matrix_fullrank(nbeq, n, 3, excluded_values=[0])
B=zeros(nbeq, 1)
sys_tex = latexsys(A, B)
==

text ==
On considère le sous-espace de $! \mathbb{R}^{{n}} !$ formé des vecteurs $! (x,y,z) !$ tels que
$$ {{sys_tex}} .$$
Déterminer une base de ce sous-espace (écrire cette base comme un ensemble, entre accolades).
==

evaluator ==
def evalans(strans):
    try:
        ans = latex2sympy(input.value)
        M = Matrix(ans).transpose()
    except:
        return (-1, "La réponse doit être un ensemble de vecteurs su sous-espace.")
    if M.shape!=(m,d):
        return (-1, "La réponse doit être un ensemble de vecteurs su sous-espace.")
    if not (A*M == zeros(nbeq,m)):
        return (0, "Cette famille n'est pas une base du sous-espace.")
    if M.rank() != m:
        return (0, "Cette famille n'est pas une base du sous-espace.")
    return (100, "")

score, feedback = evalans(input.value)
==
