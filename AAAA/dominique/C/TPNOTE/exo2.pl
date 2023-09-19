
author= DR
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

tag=tpnote

title = Analyse d'une suite Finie d'entiers


@ truc.py 

text==  

Votre programme doit lire une suite d'entiers positifs et s'arreter sur le premier entier négatif ou nul. 

Puis doit afficher un par ligne dans cet ordre "pairs","impairs","multiples de trois","aucunes" en fonction de la propriété valide pour tout 
les entiers lus.

Exemple:   
6 12 -1   

Affichera:  
pairs  
mutiples de trois   

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
    globals()[f"mplsoluce{i}"]= t



==



