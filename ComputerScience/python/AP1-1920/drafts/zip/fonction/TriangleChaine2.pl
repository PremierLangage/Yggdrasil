



# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Triangle chaine
text==  
Modifier les  fonctions de l'exercice TriangleEtoile pour que l'utilisateur choisisse
 la chaine à répéter?<br> 
 *ligne-etoiles(n)* devient *ligne(n,ch)* et *triangle_etoiles(n)*
 devient *triangle(n,ch)*

 Exemple<br>
triangle(3,'\*')

\*<br>
\*+\*\*<br>
\*+\*\*+\*\*\*<br>
\*+\*\*<br>
\*<br>

et triangle(3,'to')
to <br>
to+toto <br>
to+toto+tototo <br>
to+toto <br>
to <br>

==


==
before==
import random
def ligne(n,ch):
    s=""
    if n>0:
        s=ch
        etoile=ch
        if n>1:
            for i in range(n-1):
                etoile+=ch
                s=s+"+"+etoile
    return s




def triangle(n,ch):
    s="\\n"
    for i in range(1,n+1):
        s+=ligne(i,ch)+"\\n"
    for i in range(n-1):
       s+=ligne(n-1-i,ch)+"\\n"
    return s
import random

n=random.randint(4,7)
p='#'
pltest2=""">>> triangle({},{})# Test aleatoire \n'""".format(n,p)+ str(triangle(n,p))+"'\n"

n=n+2
p='$'
pltest3=""">>> triangle({},{})# Test aleatoire \n'""".format(n,p)+ str(triangle(n,p))+"'\n"

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







