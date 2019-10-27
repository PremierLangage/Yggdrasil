



# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Nombres chanceux
xtext==  
On appelle "Nombres chanceux" les nombres restant après l'application d'un crible 
sur la suite des entiers impairs strictement positifs.<br>
Contrairement à celui d'Eratostène, ce crible ne prend en compte 
que les entiers qui n'ont pas précédemment été rayé.<br>
Pour obtenir les nombres chanceux strictement inférieurs à $%26%$,<br> 
on part de la liste [1,3,5,7,9,11,13,15,17,19,21,23,25]<br>
 on considère initialement le deuxième nombre non rayé :3. <br>
 En partant du début de la liste on raye,en le remplaçant par 0, un nombre non rayé tous les 3.<br>
 La liste devient:<br>
[1,3,0,7,9,0,13,15,0,19,21,0,25]<br>
on considère ensuite le troisième nombre non rayé :7. <br>
 En partant du début de la liste on raye un nombre non rayé tous les 7.<br>
 la liste devient:<br>
[1,3,0,7,9,0,13,15,0,0,21,0,25]<br>
on considère maintenant le quatrième nombre non rayé :9. <br>
 En partant du début de la liste on raye un nombre non rayé tous les 9.<br>
 La liste est inchangé, on a trouvé tous 
 les nombres chanceux strictement inférieurs à $%26%$,<br>
[1,3,7,9,13,15,21,25]
 ==
before==
def fibo(n):
    if n<=0:
        return []
    if n==1:    
        return [0]
    if n==2:
        return [0,1]
    l=[0,1]
    for i in range(2,n):
        l.append(l[i-1]+l[i-2])
    return l
import random

n=random.randint(11,51)

pltest3=""">>> fibo({})\n{}""".format(n,fibo(n))

after=before
==



pltest0==
>>> fibo(2)==[0, 1]
True
==
pltest1==
>>> fibo(-9)
[]
==
pltest2==
>>> fibo(11)
[0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
==





