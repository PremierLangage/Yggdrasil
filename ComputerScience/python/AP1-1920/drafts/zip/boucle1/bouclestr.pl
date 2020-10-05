


# author zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Liste des multiples

text=

textf==  

Ecrire un programme qui lit un  entier  positif et affiche la chaine de caractères formée des n premiers multiples de {XX}.

Si n vaut 4 on affiche {YY}.


Si l'entier est négatif, on ne fait rien.

==
before==
import random 

XX= random.choice([13,17,23,27,51])
soluce= f"XX={XX}\n"+soluce2
YY=""
for i in range(4):
    YY+=str(i*XX)
text = textf.format(XX=XX,YY=YY)

==

soluce2==
n=int(input())
s=""
if n>=0:
    for i in range(n):
        s+=str(i*XX)
    print(s)
==
plsoluce==
court|2 
tres court |0
tres tres court |-42
long | 110
==




