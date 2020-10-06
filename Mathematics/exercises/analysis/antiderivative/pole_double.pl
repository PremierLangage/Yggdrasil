extends = antiderivative_.pl

title = Calcul de primitive (élément simple)

lang = fr

before ==

var('x')
a=randint(-5,5,[0])
b,c=list_randint_norep(2,-5,5,[0])

f=simplify(a/(b*x+c)**2)
f_tex=latex(f)
sol=simplify(integrate(f,x))
sol_tex=latex(sol)
==

