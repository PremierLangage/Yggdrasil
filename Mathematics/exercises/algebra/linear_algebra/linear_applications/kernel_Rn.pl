extends = /model/math.pl

input =: MathInput

form ==
{{ radio|component}}
{{ input|component}}
==

radio =: RadioGroup
# Les deux lignes suivantes sont temporaires.
@ /utils/components/radio.py [customradio.py]
radio.decorator = CustomRadio

before ==
keyboards_JSON['virtualKeyboards']="sets"
input.config = keyboards_JSON

n = param['n']
nbeq = param['nbeq']
m = n-nbeq
radio.setitems(["{{ input|component }}"])
lstvar = ",".join(["x","y","z","t","u","v"][:n])

A=rand_int_matrix_fullrank(nbeq, n, 3, excluded_values=[0])
B=zeros(nbeq, 1)
sys_tex = latexsys(A, B)
==

text ==
On considère le sous-espace de $! \mathbb{R}^{{n}} !$ formé des vecteurs $! ({{lstvar}}) !$ tels que
$$ {{sys_tex}} .$$
Déterminer le noyau de cette application linéaire.
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

