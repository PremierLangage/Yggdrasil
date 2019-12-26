extends = /Mathematics/template/mathinput.pl

title = Représentation paramétrique des sous-espaces

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

n=1
m=3
d=m-n
coeffbound = 4
A=rand_int_matrix_fullrank(n,m,coeffbound)
B=zeros(n,1)
sys_tex=latexsys(A,B)
lstvec=["u","v","w"]
==

text ==
On considère l'ensemble des vecteurs $! (x,y,z) !$ tels que
$$ {{sys_tex}} $$
Trouver un vecteur qui engendre cet ensemble.
==

evaluator ==
def evalans(strans):
    ans=str2struct("\{"+input.value+"\}")
    if not all([len(v)==m for v in ans]):
        return (0,"Mauvaise taille")
    M=Matrix(ans).transpose()
    if not (A*M==zeros(n,d)):
        return (0,"Certains vecteurs ne sont pas dans l'ensemble.")
    if M.rank()!=d:
        return (0,"N'engendre pas")
    return (100,"")

score,feedback=eval ns("\{"+input.value+"\}")
==

