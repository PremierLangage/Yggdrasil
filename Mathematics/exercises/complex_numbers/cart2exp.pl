extends = /model/math/mathcomplex.pl

title = Conversion

complex_form = exponential

before ==
a = randint(1,3)
theta = randitem([pi,pi/2,3*pi/2])

with evaluate(False):
    sol = a*exp(I*theta)

z = expand_complex(sol)
==

text == 
Ecrire sous forme exponentielle le nombre complexe $! \\large {{z|latex}} !$.
==
