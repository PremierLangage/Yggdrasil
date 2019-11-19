

# author dr
# Heritage d'un type d'exercice
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl


title = Préfixe ou Suffixe  
text== 

Ecrire une fonction echange(ite,i,j) qui prend un iterable nonmutable en parametre et
 retourne une liste contenant cet iterable où les éléments aux positions i et j ont été échangés.

Si les positions i et j ne sont pas valide la fonction retourne None. 

    >>> l=[2,3,4]
    >>> echange (l,2,1)
    [2, 4, 3]

    >>> l=(2,3,4)
    >>> echange (l,2,1)
    [2, 4, 3]

    >>> l=(2,3,4)
    >>> echange (l,2,15) == None
    True


==

soluce==


==


pltest1==
>>> echange([33,11,23,44,"camion"],3,5)
>>> echange([33,11,23,44,"camion"],3,4)
[33, 11, 23, 'camion', 44]
>>> echange([33,11,23,44,"camion"],1,4)
[33, 'camion', 23, 44, 11]
>>> echange([33,11,23,44,"camion"],0,4)
['camion', 11, 23, 44, 33]
==
pltest2==
>>> echange([33,11,23,44,"camion"],-1,0)
['camion', 11, 23, 44, 33]
>>> echange([33,11,23,44,"camion"],-8,0)
==

pltest3==
>>> echange([],0,0)
>>> echange(["cent", "deux"],-2,-1)
["deux", "cent"]
==

