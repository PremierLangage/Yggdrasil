
#author=OCE
#réécriture par Emmanuel Brunache

# Heritage d'un type d'exercice 
extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

title = Dix mais pas trois

code==


==

needed=def

text==  

Programmer une fonction `dix_mais_pas_trois` qui teste si un entier (passé en paramètre) est divisible par 10 mais pas par 3.

Retourne `True` si c'est le cas, `False` sinon.


Exemple:

    >>> dix_mais_pas_trois(20)
    True
    >>> dix_mais_pas_trois(21)
    False
    >>> dix_mais_pas_trois(30)
    False
==

editor.code==
==

solution==#|python|
def dix_mais_pas_trois(n):
    return n%10==0 and n%3!=0

n = int(input("Saisie : "))
print(dix_mais_pas_trois(n))
==

before==#|python|
import random
n = random.randint(100, 1000)
def dix_mais_pas_trois(n):
    return n%10==0 and n%3!=0

pltest = """>>> dix_mais_pas_trois(2)
{}
>>> dix_mais_pas_trois(3)
{}
>>> dix_mais_pas_trois(30)
{}
>>> dix_mais_pas_trois(40)
{}
>>> dix_mais_pas_trois({})
{}
""".format(dix_mais_pas_trois(2), dix_mais_pas_trois(3), dix_mais_pas_trois(30), dix_mais_pas_trois(40), n, dix_mais_pas_trois(n))
==







