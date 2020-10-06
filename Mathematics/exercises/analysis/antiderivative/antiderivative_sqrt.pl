extends = antiderivative_.pl

title = Calcul de primitive

lang = fr

before ==


var('x')
a=randint(-5,5,[0])
b,c=list_randint_norep(2,-5,5,[0])

b0=Rational(-c,b)
if b>0:
    dom=r"\rbrack %s ,+\infty\lbrack" % latex(b0)
else:
    dom=r"\rbrack -\infty, %s \lbrack" % latex(b0)

f=randitem([a*sqrt(b*x+c),a/sqrt(b*x+c)])
f=simplify(f)
f_tex=latex(f)
sol=integrate(f,x).doit()
sol_tex=latex(sol)
==

text ==
Calculer une primitive de la fonction
$$ f : x \mapsto {{f_tex}} $$
sur l'intervalle $! {{dom}} !$.
==


