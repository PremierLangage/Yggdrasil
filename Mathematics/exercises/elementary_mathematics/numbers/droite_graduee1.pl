extends = droite_graduee_.pl

before ==
n = 1
k = choice([3, 5, 5, 7, 7])
if k == 3:
    c = choice([4, 4, 2])
elif k == 5:
    c = choice([6, 6, 3, 3, 3, 2])
elif k == 7:
    c = choice([8, 8, 4, 4, 4, 2])
b = randint(1, c-1)

xsol = b/c
ysol = 0

jxg.attributes =  {"showNavigation":False, "showReload": True, "boundingbox":[-0.2,4,n+0.2,-4], "axis":False, "keepAspectRatio":False}
jxg.setscript(script_init + "\n"+ script_aux, locals())
==

question ==
Place le point $! M !$ d'abscisse $! \displaystyle \frac{ {{b}} }{ {{c}} } !$.
==