extends = /Mathematics/template/mathexpr.pl

title = Transformation d'écritures avec racine carrée

lang = fr


before ==
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON

from sympy.ntheory.factor_ import core

a,b=1,1
while a==1 or b==1:
    if param['form']=="sqrt(p)":
        p=randint(50,200)
        v=p
        expr=r"\sqrt{ %d }" % (p)
    elif param['form']=="p sqrt(q) sqrt(r)":
        p=randint(5,10)
        q,r=list_randitem_norep(2,[2,3,5,6,7,8,10,11,12,13,14,15,18,20,21,22,24,26,27,28])
        v=p**2*q*r
        expr=r"%d \sqrt{ %d } \sqrt{ %d }" % (p,q,r)
    elif param['form']=="p sqrt(q)/sqrt(r)":
        p=randint(2,6)
        q,r=list_randitem_norep(2,[2,3,5,6,7,8,10,11,12])
        v=p**2*Rational(q,r)
        expr=r"%d \sqrt{ %d } \sqrt{ %d }" % (p,q,r)
    v1,v2=fraction(v)
    b=core(v1)
    a=Rational(int(sqrt(v1/b)),v2)
sol=a*sqrt(b)
sol_tex=latex(sol)
==

text ==
Ecrire $! {{expr}} !$ sous la forme  $% a \sqrt{b}%$, où $%a%$ est un entier et $%b%$ est le plus petit entier positif possible.
==

evaluator==
def ans_eval(strans,sol):
    try:
        ans=str2expr(strans)
    except:
        return (-1,"FailedConversion","Votre réponse n'est pas sous la forme attendue")
    if type(ans)!=sp.Mul:
        return (-1,"","Votre réponse n'est pas sous la forme attendue")
    if not (is_sqrt(ans.args[0]) and ans.args[1].is_Integer) and not (is_sqrt(ans.args[1]) and ans.args[0].is_Integer):
        return (-1,"",str(is_sqrt(ans.args[1]))+"Votre réponse n'est pas sous la forme attendue")
    if not is_equal(ans,sol):
        return (0,"","")
    return (100,"","")

score,_,feedback=ans_eval(input1.value,sol)
==

solution ==
La solution est $! {{sol_tex}} !$.
==








