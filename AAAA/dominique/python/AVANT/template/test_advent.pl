

title=Une fonction carre

tag=function # N'oubliez pas de remplir ce champs svp
extends= advent.pl
@ /builder/before.py [builder.py]
piste=verte
text==
Ecrivez une fonction `carre` qui retourne le carré de son paramêtre
==

@ exemple
exemple =@ exemple

sol=33

before==
import random 
p=random.randint(23,77)
pltest2=""">>> carre({})\n{}\n""".format(p, p**2)
p+=17
pltest3=""">>> carre({})=={}# Hidden value test\nTrue\n""".format(p, p**2)


with open("template.html","r") as f:
     g = f.read()
form += g

data = g
with open("data","w") as f:
    f.write(g)



==

pltest0==
>>> import types #
>>> "carre" in globals() # carre existe 
True
>>> type(carre)  # est carre est une fonction 
<type 'function'>
==

pltest1==
>>> carre(510) == 260100 # le carre de 510
True
>>> carre(0)
0
>>> carre(-10)
100
>>> 
==


editor.code==

==
editor.height=145










