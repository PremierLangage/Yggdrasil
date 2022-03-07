extends = /Mathematics/template/mathinput.pl

title = Forme exponentielle vers cartésienne


before ==
a=randint(1,3)
with evaluate(False):
    z = a*exp(I*pi/4)
sol = z.expand
==

question == 
Ecrire sous forme cartésienne le nombre complexe $! \\large {{ z|latex }} !$.
==