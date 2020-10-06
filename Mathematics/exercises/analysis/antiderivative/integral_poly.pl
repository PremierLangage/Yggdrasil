extends = integral_.pl

before ==

var('x')
x0,x1=list_randint_norep(2,-2,2)
d=randint(2,3)
f=rand_int_poly(d,2,3,x)
f_tex=latex(f)
sol=integrate(f,(x,x0,x1)).doit()
sol_tex=latex(sol)
x0_tex,x1_tex=latex(x0),latex(x1)
==


