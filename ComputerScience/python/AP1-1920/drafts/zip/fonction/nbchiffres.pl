 author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Apparition d'un chiffre


text==
On veut déterminer le nombre d'apparition d'un chiffre particulier dans $%2^n%$.

Pour cela écrire une fonction  **nombre_chiffre(exp,chiffre)** qui reçoit un entier positif exp et un chiffre chiffre et renvoie  le nombre 
 d'apparition du chiffre dans $%2^{exp}%$ (le code n'utilisera pas de str). 
 
 Si exp n'est pas un entier positif ou si chiffre n'est pas un chiffre,
 la fonction renvoie None

 Exemples<br>

    &gt;&gt;&gt; nombre_chiffre(0,1)==1<br>
    True<br>
    &gt;&gt;&gt; coefficients_binome(8)<br>
    1 3 3 1<br>
==

Xeditor.code==
def nombre_chiffre(n,c):
    if n<0 or not 0<=c<=9:
        return None
    nb=0
    n=2**n
    print(n)
    while  n>0:
        if n%10==c:
            nb+=1
        n//=10
    return nb
