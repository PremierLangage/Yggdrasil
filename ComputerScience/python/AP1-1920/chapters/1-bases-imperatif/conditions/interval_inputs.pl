
extends= ../../../templates/plsoluce.pl

@ interval.py

code==
x=int(input()) # pas de message dans l'input 
if ??? :
    print("OUI")
else:
    print("NON")
==

text==

Ecrivez un script qui lit un entier avec input puis affiche 
OUI si l'entier appartient à l'intervale $% I %$ suivant et NON sinon.
<br/>
##   $%I = {{s}}%$

Chouette des maths. 

==
 
niveau%2

solucef==
import random
x=int(input())
if {}:
    print("OUI")
else:
    print("NON")
==
before==
from interval import makeinterval


s,exp,values = makeinterval(niveau)
plsoluce=""
for i,v in enumerate(values):
    plsoluce += "l'element {} est il dans l'ensemble $%I%$ | {} \n".format(v,v)

soluce=solucef.format(exp)

==

title= x $%\in%$ interval ?









