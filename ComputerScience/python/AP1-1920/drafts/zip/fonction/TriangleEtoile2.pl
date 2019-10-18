


# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Triangle étoilé
text==  
On veut dessiner à l'aide d'étoiles '\*' et de plus "+" des triangles de la forme 

\*<br>
\*+\*\*<br>
\*+\*\*+\*\*\*<br>
\*+\*\*<br>
\*<br>

Pour cela:<br>
* écrire une fonction **ligne_etoile(n)** qui reçoit un entier
et renvoie une chaine formée de : <br>
1 caractère étoile ('\*'), 2 caractères étoile ('\*'),...,n caractères étoile ('*') séparés par des caratères plus ('+').<br>
    si elle reçoit 4 elle renvoie "\*+\*\*+\*\*\*+\*\*\*\*".<br>
    si elle reçoit 1 elle renvoie "\*"<br>
    si elle reçoit un entier inférieure à 1 elle renvoie la chaine vide. <br>
* utilisez cette fonction pour écrire une fonction 'triangeetoile(n) qui reçoit un entier n 
 et si n est >0 et renvoie une chaine formant un triangle
de 2n-1 lignes

Exemple
 
triangeetoile(3) renvoie la chaine "\n\*\n\*+\*\*\n\*+\*\*+\*\*\*\n\*+\*\*\n\*\n"
dont l'affichage produit
'
\*<br>
\*+\*\*<br>
\*+\*\*+\*\*\*<br>
\*+\*\*<br>
\*<br>
'
==
before==
import random

mplsoluce2="Test aléatoire\n"
n=random.randint(4,7)
mplsoluce2 += str(n)+"\n"
==

zsoluce==

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
==
pltest1==
>>> triangle_etoiles(2)
'
*
*+**
*
==




