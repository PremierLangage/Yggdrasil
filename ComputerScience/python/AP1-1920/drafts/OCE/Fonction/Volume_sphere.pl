#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Dix mais pas trois

code==
#
#
#
n = ??(input("Saisie : "))
#

==

text==  

Calculer le volume d'une sphère à l'aide de la formule $%V=\frac{4}{3}{\pi}R^3%$. <br>

vous écrirez naturellement un programme qui récupère un entier au clavier, appel la fonction et affiche le résultat.

==

soluce==#|python|
def dix_mais_pas_trois(n):
    if n%10==0 and n%3!=0:
        return True
    else:
        return False

n = int(input("Saisie : "))
print(dix_mais_pas_trois(n))
==

mplsoluce0==
False
2
==
mplsoluce1==
False
3
==

mplsoluce2==
True
10
==








