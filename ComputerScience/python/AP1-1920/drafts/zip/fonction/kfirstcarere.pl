

author=DR

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl 

title = La somme des k premiers carrés (de 0 à (k-1)^2)

code==
def carre(...):


==

text==  

Programmer une fonction **carre** qui prend en paramètre un entier et retourne son carré.<br>

Programmepr ensuite une fonction **premiers_carres** qui : <br>
* prend en paramètre un entier k <br>
* imprime LA SOMME des k premiers carrés de 0 à (k-1)^2 <br>

==

soluce==#|python|
def carre(n):
    return n*n

def premiers_carres(k) :
    s=0
    for i in range(k) :
        s += (carre(i))
    return s

z = int(input())
print(premiers_carres(z))

==
before==
import random
def mon_carre(n):
    return(n*n)

def premiers_carres(k) :
    s=0
    for i in range(k) :
        s += (mon_carre(i))
    return s

n=random.randint(14,50)
c=random.randint(0,10)
res=mon_carre(n)
pltest1=f""">>> if carre({n})!={res} : print("la fonction carre ne fonctionne pas")  """
res=premiers_carres(c)
pltest2=f""">>> if premiers_carres({c})!={res} : print("la fonction premiers_carres ne fonctionne pas")  """
after=before
==

pltest0==
>>> carre(2)
4
==


