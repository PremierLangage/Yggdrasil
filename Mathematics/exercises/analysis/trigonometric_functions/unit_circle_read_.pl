extends = /Mathematics/template/mathexpr.pl

title = Cercle trigonométrique

lang = fr

before ==
lstangle=eval(param['lstangle'])
angle=randitem(lstangle)
xM=float((cos(angle)).evalf())
yM=float((sin(angle)).evalf())
==




