


# author zip
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title =triangle chaine
text==  
modifier la fonction de l'exercice TriangleEtoile pour que l'uilisateur choisisse
 la chaine à répéter


Exemples
 
Entrez un entier : 5 <br>
Entrez un chaine : *
*<br>
*+**<br>
*+**+***<br>
*+**+***+****<br>
*+**+***+****+*****<br>
*+**+***+****<br>
*+**+***<br>
*+**<br>
*<br>

Entrez un entier : 3 <br>
Entrez une chaine : to <br>
to <br>
to+toto <br>
to+toto+tototo <br>
to+toto <br>
to <br>

==
before==
import random

mplsoluce2="Test aléatoire\n"
n=random.randint(4,7)
mplsoluce2 += str(n)+"\n"
mplsoluce2 +="hi"
==

soluce==

def ligne_chaine(n,ch):
    s=""
    if n>0:
        s=ch
        etoile=ch
        if n>1:
            for i in range(n-1):
                etoile+=ch
                s=s+"+"+etoile
    return s



n=int(input("Entrez un entier : "))
ch=input("Entrez une chaine : ")
for i in range(1,n+1):
    print(ligne_chaine(i,ch))
for i in range(n-1):
    print(ligne_chaine(n-1-i,ch))


==
mplsoluce0==
classique
3
*
==
mplsoluce1==
negatif
-9
+
==






