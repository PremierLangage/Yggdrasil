extends = droite_graduee_.pl

before ==
n = randint(2, 5)
k = choice([3, 5])

a = randint(1, n-1)
if k == 3:
    c = 2
else:
    c = randint(2, 3)

b = randint(1, c-1)

if randint(0, 1) == 0:
    sg = "+"
    f1 = a*c+b
else:
    sg = "-"
    f1 = a*c-b

xsol = f1/c
ysol = 0

jxg.attributes =  {"showNavigation":False, "boundingbox":[-0.2,4,n+0.2,-4], "axis":False, "keepAspectRatio":False}
jxg.setscript(script_init + "\n"+ script_aux, locals())
==

name = M

question ==
Place le point $! M !$ d'abscisse $! \displaystyle {{a}} {{sg}} \frac{ {{b}} }{ {{c}} } !$.
==
