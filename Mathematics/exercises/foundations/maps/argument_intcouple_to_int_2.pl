extends = argument_intcouple_to_int_.pl

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

n,m=list_randitem_norep(2,symbols("n,m,p,q,r"))
nn=latex(n)
mm=latex(m)
expr=factor(randint(-3,3,[0])*(n+randint(-2,2))*(m+randint(-2,2)))
expr_tex=latex(expr)
f = Lambda ( (n,m) , expr)

E1=randitem("N","Z")
if E1=="N":
    x1=randint(0,3)
    E1_tex="\mathbb{N}"
else:
    x1=randint(-3,3)
    E1_tex="\mathbb{Z}"

E2=randitem("N","Z")
if E2=="N":
    x2=randint(0,3)
    E2_tex="\mathbb{N}"
else:
    x2=randint(-3,3)
    E2_tex="\mathbb{Z}"

y=f(x1,x2)
y_tex=latex(y)
==
