# Boris Jabot 11/09/2019 OK
author=Dominique Revuz 
title= lecture d'un entier

tag=input|print|variable

extends=/ComputerScience/python/template/soluce.pl
 

@ /builder/before.py [builder.py]

soluce==
a=int(input())
print("Le capitaine a %d ans. Dans {{X}} ans il aura %d ans." % (a,a+{{x}}))
print("Le perroquet du capitaine a %d ans." % (((a+{{y}})//{{z}})-{{y}}))
==

code==
# lecture au clavier et transformation en entier puis affectation
age=int(input())
# Le capitaine a __ ans. Dans {{X}} ans il aura __ ans.
# Le perroquet du capitaine à __ ans.
==



text==
Ecrivez un programme utilisant une unique variable **age** qui lit cette information au clavier puis affiche :

	Le capitaine a __ ans. Dans {{X}} ans il aura ___ ans.

puis sachant que dans {{Y}} ans, le perroquet aura {{Z}} de l’âge du capitaine (arrondi à l'année inférieur) quel est l'age actuel du perroquet, le programme affiche:

	Le perroquet du capitaine a __ ans.


==

before==

import random 
X,x= random.choice([("deux",2),("trois",3),("quatre",4) ,("cinq",5)])
Y,y= random.choice([("deux",2),("trois",3),("quatre",4),("cinq",5)])
Z,z= random.choice([("la moitier",2),("le tiers",3),("le quart",4)])


import jinja2
soluce= jinja2.Template(soluce).render(globals())
code=  jinja2.Template(code).render(globals())
==


plsoluce==
Test 1 |33
Test 2 |66
Test 4 |100000
==



