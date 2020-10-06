extends = antiderivative_.pl

title = Calcul de primitive

before ==

var('x')
a=randitem([Rational(1,2),Rational(1,3),Rational(1,4),2,3,4])
b=randint(-3,3,[0])
f=randitem([sin(a*x+b),cos(a*x+b),sin(a*x)+b,cos(a*x)+b])
f_tex=latex(f)
sol=integrate(f,x).doit()
sol_tex=latex(sol)
==


