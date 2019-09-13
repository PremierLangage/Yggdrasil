extends = /Mathematics/template/mathexpr.pl

title== #|html|
Puissance
==

before== #|python|
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON

var('x')

ok=False
while not ok:
    n1=randint(-6,6,[0,1])
    n2=randint(-6,6,[0,1])
    n3=randint(-6,6,[0,1])
    val=[r"x^{ %d }" % n1,r"(x^{ %d })^{ %d }" % (n2,n3)]
    rd.shuffle(val)
    if param['formula']=="prod":
        expr = r"%s \times %s " % (val[0],val[1])
    elif param['formula']=="quot":
        expr = r"\frac{ %s }{ %s }" % (val[0],val[1])
    sol=simplify(str2expr(expr))
    if type(sol)==sp.Pow:
        ok=True
        n=sol.args[1]

sol_tex=" %s ^{ %s }" % (x,n)
==


text== #|html|
Simplifier l'expression $% \displaystyle {{expr}} %$ en l'écrivant sous la forme $% x^n %$, où $% n %$ est un entier.
==


evaluator== #|python|
var('x')
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

