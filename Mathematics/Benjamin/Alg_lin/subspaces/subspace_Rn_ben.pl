extends = /model/math.pl

title = Représentation des sous-espaces de $! \mathbb{R}^3!$

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

n=param['n']
m=param['m']
d=m-n
coeffbound = 4
A=rand_int_matrix_fullrank(n,m,coeffbound)
B=zeros(n,1)
sys_tex=latexsys(A,B)
==

text ==
On considère le sous-espace de $! \mathbb{R}^3 !$ formé des vecteurs $! (x,y,z) !$ tels que
$$ {{sys_tex}} .$$
Trouver deux vecteurs qui engendrent ce sous-espace.
==

evaluator ==
def evalans(strans):
    try:
        ans=str2struct("\{"+input.value+"\}")
        M=Matrix(ans).transpose()
    except:
        return (-1,"La réponse doit être constituée de deux vecteurs de $! \mathbb{R}^3 !$ séparés par une virgule.")
    if M.shape!=(m,d):
        return (-1,"La réponse doit être constituée de deux vecteurs de $! \mathbb{R}^3 !$ séparés par une virgule.")
    if not (A*M==zeros(n,d)):
        return (0,"Ces vecteurs n'engendrent pas le sous-espace.")
    if M.rank()!=d:
        return (0,"Ces vecteurs n'engendrent pas le sous-espace.")
    return (100,"")

score,feedback=evalans("\{"+input.value+"\}")
==


