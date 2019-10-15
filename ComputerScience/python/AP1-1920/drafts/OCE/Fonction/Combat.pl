
#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Combatre un adversaire

code==
n= int(input("Entrez un nombre : "))



print("avec(1)",??,"avec(2)",??)

==

text==  
Imaginez-vous dans un jeu de rôle ! <br>

Vous rencontrez un enemi avec lequel il est impossible de discuter ... un prof de math par exemple. 
C'est un adversaire particulièrement redoutable et vous n'avez pas le choix : il faut sauver votre peau !

Ecrivez une fonction qui vous permettra de combattre n'importe quel enemi du jeu de la façon suivante : 

1 Les deux adversaires lancent un dés,
2 on compare le résultat 
3 la différence des deux lancés est soustrait au points d'endurance de l'adversaire dont le lancé est inférieur
4 en cas d'égalité on recommence les lancez de dés

==
soluce==
#import math
croiss,decroi=0,0
n=int(input("Entrez un nombre : ")) 
if n<0:
    print("erreur")
else:
    for i in range(1,n+1):
        croiss+=1/(i*i)
    for i in range(n,0,-1):
        decroi+=1/(i*i)
    print("avec(1)",croiss,"avec(2)",decroi)
#print(math.pi*math.pi/6)
==
plsoluce==
erreur | -4
un | 1
petit | 14
grand | 10001
==



