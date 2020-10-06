extends = integral_.pl

before ==

var('x')
x0,x1=sorted(list_randint_norep(2,-3,3))
a,b=list_randint_norep(2,-5,5,[0])
f=abs(a*x+b)
f_tex=latex(f)
sol=integrate(f,(x,x0,x1)).doit()
sol_tex=latex(sol)
x0_tex,x1_tex=latex(x0),latex(x1)
==



