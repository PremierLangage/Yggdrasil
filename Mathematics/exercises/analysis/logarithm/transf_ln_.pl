extends = /Mathematics/template/mathexpr.pl

title = Transformation d'expressions avec logarithmes


lang = fr

extracss == #|html| 
<style>
.fcontainer {
    display: flex;
    align-items: center;
}
c-math-input {
    //display: inline-block;
    width: 100%;
}
</style>
==

before ==
keyboards_JSON['virtualKeyboards']="functions"
input1.config = keyboards_JSON

p,q=list_randint_norep(2,2,5)
formula=randitem(eval(param['formulas']))
if formula=="u*ln(p)":
    u=randint(2,4)
    sol=p**u
    expr="%d \ln(%d)" % (u,p)
elif formula=="-u*ln(p)":
    u=randint(-4,-2)
    sol=p**u
    expr="%d \ln(%d)" % (u,p)
elif formula=="ln(p)+ln(q)":
    sol=p*q
    expr="\ln(%d) + \ln(%d)" % (p,q)
elif formula=="ln(p)-ln(q)":
    sol=p/q
    expr=randitem(["\ln( %(p)s ) - \ln( %(q)s )","-\ln( %(q)s ) + \ln( %(p)s )"]) % {"p":p,"q":q}
elif formula=="u*ln(p)+ln(q)":
    u,v=list_randitem_norep(2,[1,randint(2,4)])
    sol=p**u*q
    expr="%d \ln(%d)+\ln(%d)" % (u,p,q)
elif formula=="u*ln(p)-ln(q)":
    s1,s2=list_randitem_norep(2,[-1,1])
    u,v=list_randitem_norep(2,[s1*1,s2*randint(2,4)])
    sol=p**u*q**v
    expr=latex(u*ln(p)+v*ln(q))
elif formula=="u*ln(p)+vln(q)":
    u,v=list_randint_norep(2,2,4)
    sol=p**u*q**v
    expr="%d \ln(%d)+%d \ln(%d)" % (u,p,v,q)
elif formula=="u*ln(p)-vln(q)":
    s1,s2=list_randitem_norep(2,[-1,1])
    u,v=list_randint_norep(2,2,4)
    u,v=s1*u,s2*v
    sol=p**u*q**v
    expr="%d \ln(%d)+%d \ln(%d)" % (u,p,v,q)
==

text ==
Ecrire $% {{expr}} %$ sous la forme  $% \ln(a)%$, où $%a%$ est un nombre.
==

evaluator==
def ans_eval(strans,sol):
    try:
        ans=str2expr(strans)
    except:
        return (-1,"FailedConversion","Votre réponse n'est pas sous la forme attendue")
    if type(ans)!=sp.log:
        return (-1,"","Votre réponse n'est pas sous la forme attendue")
    if not is_equal(ans.args[0],sol):
        return (0,"","")
    return (100,"","")

score,_,feedback=ans_eval(input1.value,sol)
==


wims ==


\if{\type=9}{
\text{typerep=algexp}
\text{expr=randitem(ln(\p)+\q,\q+ln(\p))}
\text{a=simplify(\p*exp(\q))}
}
\if{\type=10}{
\text{typerep=algexp}
\text{l1=shuffle(-1,1)}
\integer{s1=\l1[1]}
\integer{s2=\l1[2]}
\text{expr=randitem(\s1*ln(\p)+\s2*\q,\s2*\q+\s1*ln(\p))}
\text{a=simplify(exp(\expr))}
}
\if{\type=11}{
\text{typerep=algexp}
\text{u=randint(2..4)}
\text{expr=randitem(\u*ln(\p)+\q,\q+\u*ln(\p))}
\text{a=simplify(\p^(\u)*exp(\q))}
}
\if{\type=12}{
\text{typerep=algexp}
\text{u=randint(2..4)}
\text{l1=shuffle(-1,1)}
\integer{s1=\l1[1]}
\integer{s2=\l1[2]}
\text{expr=randitem(\s1*\u*ln(\p)+\s2*\q,\s2*\q+\s1*\u*ln(\p))}
\text{a=simplify(exp(\expr))}
}



==




