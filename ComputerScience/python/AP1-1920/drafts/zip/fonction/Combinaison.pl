
# author zip
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = triangle pas
text==  

Ecrire une fontion *factoriel(n)* qui reçoit un entier positif et renvoie sa factorielle.

Si l'entier est négatif la fonction renvoie *None*
Ecrire une fontion *combinaison(n,p)* qui reçoit deux entiers positif 
et renvoie le nombre decombinaions de p éléments choisis parmi n éléments.

On rappelle que ce nombre vaut $%\frac{n!}{n! \times(n-p)!} %$


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



