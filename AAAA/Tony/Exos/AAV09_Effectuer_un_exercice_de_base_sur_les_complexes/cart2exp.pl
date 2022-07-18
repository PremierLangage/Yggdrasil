# Author : inconnu, repris dans le pot commun, réutilisé par Tony et Jeanne
# Date 21/07/2021
#Etat : à débugguer

extends = /model/math/complex.pl

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
