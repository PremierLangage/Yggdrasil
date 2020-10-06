extends = antiderivative_.pl

title = Calcul de primitive

lang = fr



before ==

var('x')
a=randint(-5,5,[0])
b,c=list_randint_norep(2,-5,5,[0])
d=randint(4,7)

f=a*(b*x+c)**d
f_tex=latex(f)
sol=simplify(Rational(a,b*(d+1))*(b*x+c)**(d+1))
sol_tex=latex(sol)
==


