extends = antiderivative_.pl

title = Calcul de primitive

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="functions"
input.config = keyboards_JSON

var('x')
a=randint(-5,5,[0])
b,c=list_randint_norep(2,-5,5,[0])
d=randint(4,7)

f=a*(b*x+c)**d
f_tex=latex(f)
sol=integrate(f,x).doit()
sol_tex=latex(sol)
==

