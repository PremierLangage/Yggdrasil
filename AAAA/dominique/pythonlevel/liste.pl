
title= Manipulation de liste

text==

Ecfrire une fonction **{{name}}** qui prend un parametre une liste d'entier 
et qui retourne une liste composée des entiers **{{prop}}**.

==

before==
import random

name = random.choice(["f","gg","nip","pop","trap","fu","bar","fubar"])

a=random.randint(1,4)
if a==1:
    prop = "pairs"
    pred = lambda x: x%2==0
elif a==2:
    prop = "impairs"
    pred = lambda x: x%2==1
elif a== 3:
    prop = "strictement negatifs"
    pred= lambda x: x< 0 
elif a== 4:
    prop = " negatifs ou nuls"
    pred= lambda x: x<= 0 
elif a== 5:
    prop = "strictement positifs"
    pred= lambda x: x< 0 
elif a== 6:
    prop = " positifs ou nuls"
    pred= lambda x: x<= 0 

==

form=

grader=
@/builder/before.py [builder.py]

@ /lib/utils/sandboxio.py