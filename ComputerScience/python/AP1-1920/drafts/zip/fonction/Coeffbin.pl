
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
On rappelle que ce nombre vaut $%\frac{n!}{p! \times(n-p)!} %$ si $%0 \le p\le n %$ et 0 sinon.
Utilisez ces fonctions pour écrire un programme qui lit un entier  positif n et affiche une ligne
indiquant les coefficients de développement de $%(a+b)^n%$.
Le programme affiche "non défini" si n est négatif
Exemples

Entrez un entier positif :0 <br>
1<br>
Entrez un entier positif : 3<br>
1 3 3 1<br>
Entrez un entier positif : -1<br>
non défini<br>

Remarque

Cette méthode n'est pas efficace pour de grandes valeurs de n et p (elle effectue beaucoup de calculs inutiles).
Nous en étudirons une meilleure plus tard.
==
soluce==
def factoriel(n):
    if n<0:
        return None
    f=1
    for i in range(n):
        f*=i+1 
    return f 
def combinaison(n,p):
    if n<0 or p>n:
        return 0
    return factoriel(n)/(factoriel(n-p)*factoriel(p))
n=int(input("n"))
if n<0:
    print("non défini")
else
    s=""
    for p in range(n+1):
        s+=str(int(combinaison(n,p)))+" "
    print(s)

==
mplsoluce0==
classique
3
==





