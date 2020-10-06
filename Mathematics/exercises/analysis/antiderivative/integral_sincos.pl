extends = integral_.pl

before ==

var('x')
x0,x1=list_randitem_norep(2,[0,pi,-pi,pi/2,-pi/2,2*pi,-2*pi])

f=randitem([sin(x/2),cos(x/2),sin(x/3),cos(x/3)])
f_tex=latex(f)
sol=integrate(f,(x,x0,x1)).doit()
sol_tex=latex(sol)
x0_tex,x1_tex=latex(x0),latex(x1)
==


