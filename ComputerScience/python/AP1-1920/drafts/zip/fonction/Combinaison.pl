
# author zip
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title =Coefficients du binôme
text==  

Ecrire une fontion *factoriel(n)* qui reçoit un entier positif et renvoie sa factorielle.

Si l'entier est négatif la fonction renvoie *None*

Ecrire une fontion *combinaison(n,p)* qui reçoit deux entiers positif 
et renvoie le nombre de combinaions de p éléments choisis parmi n éléments.
$%\binom{n}{p}%$
On rappelle que ce nombre vaut $%\frac{n!}{n! \times(n-p)!} %$ si $%0 \le p\le n %$ et 0 sinon.
Utilisez ces fonctions pour écrire un programme qui lit un entier  positif n et affiche une ligne
indiquant les coefficients de développement de $%(a+b)^n%$.
Le programme affiche "non défini" si n est négatif
Exemples

Entrez un entier ositif :0 <br>
1<br>
Entrez un entier positif : 3<br>
1 3 3 1<br>
Entrez un entier positif : -1<br>
non défini<br>
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





