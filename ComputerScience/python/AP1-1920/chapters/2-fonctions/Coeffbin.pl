

# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Coefficients du binôme

text==  

1.  Ecrire une fontion *factoriel(n)* qui reçoit un entier positif et renvoie sa factorielle.<br>

    Si l'entier est négatif la fonction renvoie *None*<br>
    <br>

2.  Ecrire une fontion *combinaison(n,p)* qui reçoit deux entiers positifs 
    et renvoie le nombre de combinaions de p éléments choisis parmi n éléments.
    $%\binom{n}{p}%$<br>

    On rappelle que ce nombre vaut $%\dfrac{n!}{p! \times(n-p)!} %$
    si $%0 \le p\le n %$, $0$ si $0 \leq n < p$ et n'est pas définit sinon.<br>
    <br>

3.  Utilisez ces fonctions pour écrire une fonction *coefficients_binome(n)* qui reçoit 
    un entier n et renvoie :<br>

    * une chaine de caractères constituée des coefficients de développement de
    $%(a+b)^n%$, s'il est positif ;

    * la chaine "Non défini" si n est négatif.<br><br>

    **Exemples de résultats attendus :**<br><br>

    &gt;&gt;&gt; coefficients_binome(0)==1<br>
    True<br>
    &gt;&gt;&gt; coefficients_binome(3)<br>
    1 3 3 1<br>
    &gt;&gt;&gt; coefficients_binome(-5)<br>
    Non défini<br><br>

*Remarque 1 :* Cette méthode n'est pas efficace pour de grandes valeurs de n et p (elle effectue beaucoup de calculs inutiles).
Nous en étudirons une meilleure plus tard.<br>
<br>
*Remarque 2 :* Le mot clé *pass* indique à Python une instruction sans effet
et qui ne fait rien. Elle est souvent utilisée lors du développement du code
pour indiquer que l'on doit écrire un bout de code plus tard.<br>
<br>
*Conseil :* N'hésitez pas à coder au préalable l'exercice sur un éditeur Python.
==
before==
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

def coefficients_binome(n):
    if n<0:
        s="Non défini"
    else:
        s=""
        for p in range(n):
            s+=str(int(combinaison(n,p)))+" "
        s+="1"
    return  s

import random, sys

n=random.randint(4,12)

pltest3=""">>> coefficients_binome({})\n'{}'""".format(n, coefficients_binome(n))

after=before
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

def coefficients_binome(n):
    if n<0:
        s="Non défini"
    else:
        s=""
        for p in range(n):
            s+=str(int(combinaison(n,p)))+" "
        s+="1"
    return  s

==
pltest0==
>>> factoriel(3) == 6 and combinaison(3,2) == 3 and coefficients_binome(2) == "1 2 1"
True
==
pltest1==
#negatif
>>> coefficients_binome(-9)
'non défini'
==

pltest2==
>>> coefficients_binome(5)
'1 5 10 10 5 1'
==



editor.code==
def factoriel(n):
    pass

def combinaion(n, p):
    pass

def coefficients_binome(n):
    pass

==

