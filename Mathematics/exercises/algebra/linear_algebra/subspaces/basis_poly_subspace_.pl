extends = /model/math.pl

before ==
keyboards_JSON['virtualKeyboards']="sets"
input.config = keyboards_JSON

n = param['n']
nbeq = param['nbeq']
m = n-nbeq

x0,x1=list_randint_norep(2,-2,2)
a=1
b=randitem([-1,1])
n = 2
m = 2
A=Matrix([[a*x0**2+b*x1**2,a*x0+b*x1,a+b]])
B=Matrix([[0]])
eq=latex_lincomb([a,b],["P(%d)" % x0 ,"P(%d)" % x1])

==

text ==
On considère le sous-espace de $! \mathbb{R}_{{n}}[X] !$ formé des polynômes $! ({{P}}) !$ tels que
$$ {{eq}} =0 .$$
Déterminer une base de ce sous-espace (écrire cette base comme un ensemble, entre accolades).
==

evaluator ==
def evalans(strans):
    try:
        var('X')
        ans = latex2sympy(input.value)
        ans = [Poly(P, X).all_coeffs() for P in ans]
        ans = [(n + 1 - len(v))*[0] + v for v in ans]
        M = Matrix(ans).transpose()
    except:
        return (-1, "La réponse doit être un ensemble de polynômes de $! \mathbb{R}_{ %s }[X] !$" % n )
    if M.shape[0] != n + 1:
        return (-1, "La réponse doit être un ensemble de polynômes de $! \mathbb{R}_{ %s }[X] !$" % n )
    if (A*M).norm() != 0:
        return (0, "Cette famille n'est pas une base du sous-espace. Ce n'est même pas une famille de polynômes du sous-espace.")
    if M.rank() < M.shape[1]:
        return (0, "Cette famille n'est pas une base du sous-espace. Elle n'est pas libre.")
    if M.rank() < m:
        return (0, "Cette famille n'est pas une base du sous-espace. Elle n'est pas génératrice.")
    return (100, "")

score, feedback = evalans(input.value)
==

