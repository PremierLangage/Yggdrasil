
extends= ../../../templates/plsoluce.pl

@ interval.py

code==
x=int(input())
==


before==
from interval import makeinterval

niveau = 2
s,exp,values = makeinterval(niveau)
plsoluce=""
for i,v in enumerate(values):
    plsoluce += "{} | {} \n".format(i,v)

soluce= f'x=int(input())\nif {}:\n    print("OUI")\nelse:\n    print("NON")'

==

title= x $%\in%$ interval ?

text==

Ecrivez un script qui lit un entier avec input puis affiche 
OUI si l'entier appartient à l'intervale suivant et NON sinon.

    $%{{s}}%$

    {{exp}}

    {{plsoluce}}
    
==




