
# author zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/template/soluce.pl
@ /builder/before.py [builder.py]
title = Rectangle dimensions variables


text==  
Les dimensions d'un rectangle sont entrées par l'utilisateur, 
le programme testeur fournira les deux valeurs.

Ecrire un programme qui calcule et affiche le périmètre et la surface du rectangle
sous la forme :

Le périmètre est ?? et la surface est ?? !
==

before==
import random
mplsoluce2="Test tiré aléatoirement \n{}\n{}\n".format(random.randint(1,1000),random.randint(1,1000))
==

soluce==
l=int(input())
la=int(input())
print("Le périmètre est",2*(l+la),"et la surface est",l*la,"!")
==
mplsoluce0==
Pour un rectangle de 2 sur 3
2 
3
==

mplsoluce1==
Un test beaucoup plus dur 
17575765776
3579877897987
==





