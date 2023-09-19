
author= DR
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

tag=tpnote

title = Analyse d'une suite Finie d'entiers


@ truc.py 

text==  

Votre programme doit lire une suite d'entiers positifs et s'arreter sur le premier entier négatif ou nul. 

Puis doit afficher le nombre d'élèments de la plus grande section constante (la même valeur) par exemple 0 si il sont tous différents.
Puis doit afficher le nombre d'élèments de la plus grande section croissante (la même valeur) par exemple 0 si la suite est purement décroissante ou constante.

Exemple:
3 3 12 -1

Affiche "vide" si le premier élément est négatif ou nul.
==

code==

lcz, ldc = 0

print(f"Plus longue partie constante {lcz}")
print(f"Plus longue partie croissante {ldc}")


==

soluce==

lcz, ldc = 0


l = int(input())
if l <=0:
    print("vide")
else:
    cr=True
    dc=True
    cc=True
    while True:
        n = int(input())
        if n<= 0:
            break
        if n % 2 == :
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

    print(f"Plus longue partie constante {lcz}")
    print(f"Plus longue partie croissante {ldc}")



==


before==
import truc
for i,t in enumerate(truc.listofmplsoluce()):
    globals()[f"mplsoluce{i}"]= t



==



