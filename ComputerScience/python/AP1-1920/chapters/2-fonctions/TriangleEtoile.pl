


# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Triangle étoilé
text==  
On veut dessiner à l'aide d'étoiles '\*' et de plus "+" des triangles de la forme 

`*`<br>
`*+**`<br>
`*+**+***`<br>
`*+**`<br>
`*`<br>
<br>

Pour cela :<br>
<br>

*   écrire une fonction `ligne_etoile(n)` qui reçoit un entier
    et renvoie une chaine formée de : <br>
    *   $%1%$ caractère étoile (`'*'`),
    *   $%1%$ caractère plus (`'+'`),
    *   $%2%$ caractères étoiles (`'*'`),
    *   $%1%$ caractère plus (`'+'`),
    *   $%\cdots%$, 
    *   $%1%$ caractère plus (`'+'`),
    *   $%n%$ caractères étoiles (`'*'`).<br>
    <br>

    Par exemple, `ligne_etoiles(4)` renverra `'*+**+***+****'`.<br>
    `ligne_etoiles(0)` ou `ligne_etoile(-1)` renverront
    la chaine vide. <br>
    <br>

*   écrire une fonction `triangle_etoiles(n)` qui reçoit un entier $%n%$ 
    et si $%n%$ est strictement positif renvoie une chaine formant
    un triangle de $%2n - 1%$ lignes. <br>
<br>

**Exemple :**<br>
<br>
`triangle_etoile(3)` renvoie la chaine
`'\n*+**\n*+**+***\n*+**\n*\n'`
dont l'affichage produit <br>
<br>
\*<br>
\*+\*\*<br>
\*+\*\*+\*\*\*<br>
\*+\*\*<br>
\*<br>

*Attention aux sauts de lignes.*

==

before==
import random
def ligne_etoiles(n):
    s=""
    if n>0:
        s="*"
        etoile="*"
        if n>1:
            for i in range(n-1):
                etoile+="*"
                s=s+"+"+etoile
        
    return s

def triangle_etoiles(n):
    s="\\n"
    for i in range(1,n+1):
        s+=ligne_etoiles(i)+"\\n"
    for i in range(n-1):
       s+=ligne_etoiles(n-1-i)+"\\n"
    return s
import random

n=random.randint(4,7)
pltest2=""">>> triangle_etoiles({})# Test aleatoire \n'""".format(n)+ str(triangle_etoiles(n))+"'\n"

n=n+1
pltest3=""">>> triangle_etoiles({})# Test aleatoire \n'""".format(n)+ str(triangle_etoiles(n))+"'\n"

after=before
==

xafter==

import random
def ligne_etoiles(n):
    s=""
    if n>0:
        s="*"
        etoile="*"
        if n>1:
            for i in range(n-1):
                etoile+="*"
                s=s+"+"+etoile
        
    return s

def triangle_etoiles(n):
    s="\\n"
    for i in range(1,n+1):
        s+=ligne_etoiles(i)+"\\n"
    for i in range(n-1):
       s+=ligne_etoiles(n-1-i)+"\\n"
    return s

pltest2="Test aléatoire\n"
n=random.randint(4,7)
pltest2=""">>> triangle_etoiles({})# Test aleatoire \n'""".format(n)+ str(triangle_etoiles(n))+"'\n"

n=n+1
pltest3=""">>> triangle_etoiles({})# Test aleatoire \n'""".format(n)+ str(triangle_etoiles(n))+"'\n"

==

Xeditor.code==

def ligne_etoiles(n):
    s=""
    if n>0:
        s="*"
        etoile="*"
        if n>1:
            for i in range(n-1):
                etoile+="*"
                s=s+"+"+etoile
        
    return s

def triangle_etoiles(n):
    s="\n"
    for i in range(1,n+1):
        s+=ligne_etoiles(i)+"\n"
    for i in range(n-1):
       s+=ligne_etoiles(n-1-i)+"\n"
    return s

==

pltest0==
>>> ligne_etoiles(1)
'*'
>>> ligne_etoiles(8) # Plus d'étoiles
'*+**+***+****+*****+******+*******+********'
==


pltest1==
>>> triangle_etoiles(2)
'\n*\n*+**\n*\n'
==










