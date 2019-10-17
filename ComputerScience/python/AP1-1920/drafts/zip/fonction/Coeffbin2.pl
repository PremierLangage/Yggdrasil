

# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Coefficients du binôme
text==  

Ecrire une fontion *factoriel(n)* qui reçoit un entier positif et renvoie sa factorielle.

Si l'entier est négatif la fonction renvoie *None*

Ecrire une fontion *combinaison(n,p)* qui reçoit deux entiers positifs 
et renvoie le nombre de combinaions de p éléments choisis parmi n éléments.
$%\binom{n}{p}%$<br>
On rappelle que ce nombre vaut $%\frac{n!}{p! \times(n-p)!} %$ si $%0 \le p\le n %$ et 0 sinon.<br>
Utilisez ces fonctions pour écrire une fonction *coefficients_binome(n)* qui reçoit 
 un entier n et renvoie <br>
 *  une chaine de caractères constituée des coefficients de développement de $%(a+b)^n%$, s'il est positif.

* la chaine "non défini" si n est négatif<br>
Exemples
>>> coefficients_binome((0)==1
True
>>> coefficients_binome((3)
1 3 3 1
>>> coefficients_binome((-5)
non défini

Remarque

*Cette méthode n'est pas efficace pour de grandes valeurs de n et p (elle effectue beaucoup de calculs inutiles).
Nous en étudirons une meilleure plus tard.*
==
sbefore==
import random
n=random.randint(4,7)
mplsoluce3=">>>\n"
mplsoluce3 += str(n)
==

zsoluce==
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

def coefficients(n)
    if n<0:
        s="non défini"
    else:
        s=""
        for p in range(n+1):
            s+=str(int(combinaison(n,p)))+" "
    return  s

==
pltest0==
>>> factoriel(3)==6 and combinaison(3,2)==3 and coefficients(2)=="1 2 1"
True
==
pltest1==
#negatif
>>>  coefficients(-9)
"non défini"
==


