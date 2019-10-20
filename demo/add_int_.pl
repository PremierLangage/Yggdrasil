extends = /template/basicinput.pl

title = Addition

before ==
import random as rd
a=rd.randint(vmin,vmax)
b=rd.randint(vmin,vmax)
==

text ==
Calculer {{a}} + {{b}}.
==

evaluator ==
try:
    if int(input.value)==a+b:
        grade=(100,"")
    else:
        grade=(0,"%d + %d = %d" % (a,b,a+b))
except:
    grade=(-1,"Votre réponse n'est pas un nombre entier.")
==

