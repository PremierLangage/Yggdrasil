author= DR
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

tag=tpnote

title = Analyse d'une suite Finie d'entiers


text==  

Votre programme doit lire une suite d'entiers positifs et s'arreter sur le premier entier négatif ou nul. 

Puis doit afficher "croissante", "décroissante","constante", "indéterminée" en fonction de la proprété correspondante 
de la suite des entiers possitifs lus.

Pour une suite constante n'affichera que "constante".

Si la suite d'entier est vide affiche "indéterminée". 
==

code==

CROISSANTE = "croissante"
DECROISSANTE= "décroissante"
CONSTANTE= "constante"
INDETERMINEE = "indéterminée"

==

soluce==

CROISSANTE = "croissante"
DECROISSANTE= "décroissante"
CONSTANTE= "constante"
INDETERMINEE = "indéterminée"

l = int(input())
if l <=0:
    print(INDETERMINEE)
else:
    cr=True
    dc=True
    cc=True
    while True:
        n = int(input())
        if n<= 0:
            break:
        if n < l:
            cr = False
        if n >l:
            dc = False
        l = n
    if cc:
        print(CONSTANTE)
    elif cr: 
        print(CROISSANTE)
    elif dc:
        print(DECROISSANTE)
    else:
        print(INDETERMINEE)
==


before==

import random
u=1
crois=[ u:= u + random.randint(2,100) for i in range(20)]
decrois = [ u:= u + random.randint(2,100) for i in range(20)]
decrois.reverse()
u = random.randint(56,178)
constante = [ u for i in range(67)]
inde = crois+decrois+constante 

pltest = f""">>> c = {crois}


==



