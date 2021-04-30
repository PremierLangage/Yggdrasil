extends = /model/math/tuple.pl

title = Antécédent

before ==
n, m = list_randitem_norep(2,symbols("n,m,p,q,r"))
expr=eval(exprcode)
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

text ==
On considère la fonction $! f : {{E1_tex}} \times {{E2_tex}} \rightarrow \mathbb{Z} !$ telle que
$$f({{nn}},{{mm}})= {{expr_tex}}$$
Déterminer un antécédent de $! {{y_tex}} !$ par  $! f !$
==