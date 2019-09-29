
extends= ../../../templates/plsoluce.pl

@ interval.py

code==
x=int(input())
==

text==

Ecrivez un script qui lit un entier avec input puis affiche 
OUI si l'entier appartient à l'intervale $% I %$ suivant et NON sinon.

    $%I = {{s}}%$
{{exp}}
{{plsoluce}}
==

before==
from interval import makeinterval

niveau = 2
s,exp,values = makeinterval(niveau)
plsoluce=""
for i,v in enumerate(values):
    plsoluce += "{} | {} \n".format(i,v)

soluce="""import random
x=int(input())
if {}:
    print("OUI")
else:
    print("NON")
""".format(exp)
==

title= x $%\in%$ interval ?








