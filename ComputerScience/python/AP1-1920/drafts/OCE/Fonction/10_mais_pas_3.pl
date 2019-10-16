
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

Programmer une fonction qui teste si un entier est divisible par 10 mais pas par 3. <br>

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
paire
2
==
mplsoluce1==
impaire 
3
==

mplsoluce2==
Grand 
10
==

mplsoluce3==
nul
0
==





