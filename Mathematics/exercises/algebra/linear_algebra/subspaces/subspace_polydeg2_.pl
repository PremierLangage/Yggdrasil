extends = /Mathematics/template/mathinput.pl

title = Représentation des sous-espaces de $! \mathbb{R}_2[X]!$

param.n % 1
param.m % 3

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON
x0,x1=list_randint_norep(2,-2,2)
a=1
b=randitem([-1,1])
n=param['n']
m=param['m']
d=m-n
A=Matrix([[a*x0**2+b*x1**2,a*x0+b*x1,a+b]])
B=Matrix([[0]])
eq=latex_lincomb([a,b],["P(%d)" % x0 ,"P(%d)" % x1])
==

text ==
On considère le sous-espace de $! \mathbb{R}_2[X] !$ formé des polynômes $! P !$ tels que
$$ {{eq}} =0 .$$
Trouver deux polynômes qui engendrent ce sous-espace.
==

evaluator ==
def evalans(strans):
    try:
        var('X')
        ans=str2struct("\{"+input.value+"\}")
        ans=[Poly(P,X).all_coeffs() for P in ans]
        ans=[(m-len(v))*[0]+v for v in ans]
        M=Matrix(ans).transpose()
    except:
        return (-1,"La réponse doit être constituée de deux polynômes séparés par une virgule.")
    if M.shape!=(m,d):
        return (-1,"La réponse doit être constituée de deux polynômes séparés par une virgule.")
    if not (A*M==zeros(n,d)):
        return (0,"Ces polynômes n'engendrent pas le sous-espace.")
    if M.rank()!=d:
        return (0,"Ces polynômes n'engendrent pas le sous-espace.")
    return (100,"")

score,feedback=evalans("\{"+input.value+"\}")
==
