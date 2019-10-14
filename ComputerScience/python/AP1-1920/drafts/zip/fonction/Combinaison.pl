
# author zip
uissance sup
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = triangle pas
text==  


Si l'entier est négatif la fonction renvoie *None*


==

soluce==
def factoriel(n):
    if n<0:
        return None
    f=1
    for i in range(n):
        f+=i+1 
    return f 

k=int(input("n"))
print(factoriel(k))
==
mplsoluce0==
classique
3
==


