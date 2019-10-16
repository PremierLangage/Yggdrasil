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

Vous devez écrire deux fonctions "cube", qui retourne le cube d'un réel et "volume_sphere" qui retourne le volume de la sphere 
et fait appel à la fonction "cube"<br>

Vous écrirez un programme demandant à un utilisateur de rentrer un réel, appelant la fonction "volume_sphere" et affichant le résultat.

==

soluce==#|python|
import numpy as np

def cube(n):
    return n**3
        
def volume_sphere(r):
    return 4 / 3 * np.pi * cube(r)

r = float(input("Entrez la valeur du rayon : "))
print("Le volume de cette sphere vaut", volume_sphere(r))
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








