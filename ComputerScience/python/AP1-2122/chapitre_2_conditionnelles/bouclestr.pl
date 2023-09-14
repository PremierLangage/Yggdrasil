


# author zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Liste des multiples

text=

textf==  

Ecrire un programme qui lit un entier *n* strictement positif et affiche la chaine de caractères formée des *n* premiers multiples de {XX} (à partir de {XX}) séparé par des '_'.

Si n vaut 4 on affiche **{YY}**.


Si l'entier est négatif, on ne fait rien.

==
before==
import random 

XX= random.choice([13,17,23,27,51])
soluce= f"XX={XX}\n"+soluce2
YY=str(XX)
for i in range(2,4):
        YY+= "_"+str((i)*XX)
text = textf.format(XX=XX,YY=YY)

==

# Attention: XX doit etre modifie selon le chiffre affiche dans l'exo pour etre valide
soluce2==
n=int(input())
s=str(XX)
if n>0:
    for i in range(2,n):
        s+="_"+str(i*XX)
    print(s)
==
plsoluce==
court| 4 
Moins court| 7 
tres court |0
tres tres court |-42
long | 110
==







