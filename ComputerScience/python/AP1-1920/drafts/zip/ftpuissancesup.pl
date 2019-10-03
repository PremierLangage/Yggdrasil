
# author zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = puissance sup


text==  

Ecrire une fontion "puis_sup" qui reçoit deux entiers #n# et #base#, avec base>1, 
et renvoie la plus petite puissance de #base# supérieure à #n#. 
puis_sup(987,2) renvoie 1024. 
Si base n'est pas strictement que 1 la fonction renvoie None

.
==


soluce==
def puis_sup((n,p):
    if p<=1:
        return None

    if n<=1:
        return 1
    puis=p
    while puis<n:
        puis*=p
    return puis
a=int(input())    
b=int(input())
print(puis_sup(a,b)
==
mplsoluce1
