



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
print(triangle(3,'\*'))
<br>
\*<br>
\*+\*\*<br>
\*+\*\*+\*\*\*<br>
\*+\*\*<br>
\*<br>
<br>

et print(triangle(3,'to'))<br>
<br>
to <br>
to+toto <br>
to+toto+tototo <br>
to+toto <br>
to <br>
<br>
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
p="A"
pltest2=""">>> triangle({},"A")# Test aleatoire \n'""".format(n,"A")+ str(triangle(n,p))+"'\n"

n=n+2
p='$'
pltest3=""">>> triangle({},'$')# Test aleatoire \n'""".format(n,'$')+ str(triangle(n,p))+"'\n"

after=before
==


editor.code==
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
    s="\n"
    for i in range(1,n+1):
        s+=ligne(i,ch)+"\n"
    for i in range(n-1):
       s+=ligne(n-1-i,ch)+"\n"
    return s
==

pltest0==
>>> ligne(1,'.')
'.'
>>> ligne(8,'*') # Plus d'étoiles
'*+**+***+****+*****+******+*******+********'
==


pltest1==
>>> triangle(2,'r2d2')
'\nr2d2\nr2d2+r2d2r2d2\nr2d2\n'
==








