extends = antiderivative_.pl

title = Calcul de primitive (élément simple)

lang = fr

before ==

var('x')
a=randint(-5,5,[0])
b,c=list_randint_norep(2,-5,5,[0])

s=randitem([-1,1])
b0=Rational(-c,b)
if (b>0 and s>0) or (b<0 and s<0):
    dom=r"\rbrack %s ,+\infty\lbrack" % latex(b0)
else:
    dom=r"\rbrack -\infty, %s \lbrack" % latex(b0)

if s>0:
    sol=Rational(a,b)*ln(b*x+c)
else:
    sol=-Rational(a,b)*ln(-b*x-c)

sol=simplify(sol)

f=simplify(a/(b*x+c))
f_tex=latex(f)
sol_tex=latex(sol)
==

text ==
Calculer une primitive de la fonction
$$ f : x \mapsto {{f_tex}} $$
sur l'intervalle $! {{dom}} !$.
==

