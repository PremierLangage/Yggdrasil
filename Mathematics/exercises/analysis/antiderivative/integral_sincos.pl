extends = integral_.pl

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

var('x')
x0,x1=list_randitem_norep(2,[Pi,-Pi,Pi/2,-Pi/2,2*Pi,-2*Pi])

f=randitem([sin(x/2),cos(x/2),sin(x/3),cos(x/3)])
f_tex=latex(f)
sol=integrate(f,(x,x0,x1)).doit()
sol_tex=latex(sol)
==

