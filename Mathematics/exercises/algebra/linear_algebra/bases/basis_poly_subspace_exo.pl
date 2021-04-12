extends = /model/math/set.pl

title = Base d'un sous-espace de $! \mathbb{R}_{2}[X] !$

before ==

x0,x1=list_randint_norep(2,-2,2)
a=1
b=choice([-1,1])
n = 2
m = 2
A=Matrix([[a*x0**2+b*x1**2,a*x0+b*x1,a+b]])
B=Matrix([[0]])
eq=latex_lincomb([a,b],["P(%d)" % x0 ,"P(%d)" % x1])

==

text ==
On considère le sous-espace de $! \mathbb{R}_{{n}}[X] !$ formé des polynômes $! P !$ tels que
$$ {{eq}} =0 .$$
Déterminer une base de ce sous-espace (écrire cette base comme un ensemble, entre accolades).
==



