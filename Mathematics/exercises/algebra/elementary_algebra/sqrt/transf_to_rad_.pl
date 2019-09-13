extends = /Mathematics/template/mathexpr.pl

title = Transformation d'écritures avec racine carrée

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON

if param['form']=="p sqrt(q)":
    p=randint(2,5)
    q=randitem([2,3,4,5,7,9])
    a=p**2*q
    expr=r"%d \sqrt{ %d }" % (p,q)
elif param['form']=="p sqrt(q) sqrt(r)":
    p=randint(2,3)
    q,r=list_randitem_norep(2,[2,3,4,5,7,9])
    a=p**2*q*r
    expr=r"%d \sqrt{ %d } \sqrt{ %d }" % (p,q,r)
elif param['form']=="p sqrt(q)/sqrt(r)":
    p=randint(2,4)
    q,r=list_randitem_norep(2,[2,3,4,5,7,9])
    a=p**2*q/r
    expr=r"%d \frac{ \sqrt{ %d } }{ \sqrt{ %d } }" % (p,q,r)
==

text==
Ecrire $% {{expr}} %$ sous la forme  $% \sqrt{a} %$, où $% a %$ est un entier.
==

evaluator== #|python|
try:
    ans=str2expr(input1.value)
    if type(ans)!=sp.Pow or ans.args[1]!=Rational(1,2):
        grade=(-1,"Votre réponse n'est pas sous la forme attendue")
    elif ans.args[0]==a:
            grade=(100,"")
    else:
            grade=(0,"")
except:
    grade=(-1,"Votre réponse n'est pas sous la forme attendue")
score,feedback=grade
==




