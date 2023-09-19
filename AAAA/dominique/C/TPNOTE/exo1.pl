author= DR
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

tag=tpnote

title = Analyse d'une suite Finie d'entiers


@ truc.py 

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
            break
        if n < l:
            cr = False
        if n >l:
            dc = False
        if n != l:
            cc = False
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
import truc
for i,t in enumerate(truc.listofmplsoluce()):
    globals()[f"mplsoluce{i+1}"]= t

mplsoluce0="""Liste Vide
-199
"""


==



