extends = /Mathematics/template/mathexpr.pl


title== #|html|
Puissance
==

before== #|python|
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON

ok=False
while not ok:
    x=randint(2,3)
    n1=randint(-4,6,[0,1])
    n2=randint(-4,6,[0,1])
    na,nb=list_randint_norep(2,1,3)
    a=x**na
    b=x**nb
    if param['formula']=="prod":
        expr = r"%d ^{ %d } \times %d ^{ %d }" % (a,n1,b,n2)
        n=na*n1+nb*n2
    elif param['formula']=="quot":
        expr = r"\displaystyle \frac{ %d ^{ %d }}{ %d ^{ %d } }" % (a,n1,b,n2)
        n=na*n1-nb*n2
    if n!=0 and n!=1:
        ok=True

sol_tex=" %s ^{ %s }" % (x,n)
==


text== #|html|
Simplifier l'expression $% {{expr}} %$ en l'écrivant sous la forme $% {{x}}^n %$, où $% n %$ est un entier.
==


evaluator== #|python|

def ans_eval(strans,x,n):
    try:
        ans=str2expr(strans)
    except:
        return (-1,"FailedConversion","Votre réponse n'est pas sous la forme attendue")
    if type(ans)!=sp.Pow:
        return (-1,"","Votre réponse n'est pas sous la forme attendue")
    if ans.args[0]!=x:
        return (-1,"","Votre réponse n'est pas sous la forme attendue")
    if ans.args[1]!=n:
        return (0,"","")
    return (100,"","")

score,_,feedback=ans_eval(input1.value,x,n)
==

solution ==
La solution est $! {{sol_tex}} !$.
==




