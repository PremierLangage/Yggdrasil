#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Sphère

code==
from math import pi
#
#
?? = ??(input("Entrez la valeur du rayon : "))
#
==

text==  

Calculer le volume d'une sphère à l'aide de la formule $%V=\frac{4}{3}{\pi}R^3%$. <br>

Vous devez écrire deux fonctions,<br>
 **cube**, qui retourne le cube d'un réel et <br>
**volume_sphere** qui retourne le volume de la sphere 
en faisant appel à la fonction **cube**. <br>

Vous écrirez un programme :
    * demandant à un utilisateur de rentrer un réel strictement positif, naturellement un volume ne peut pas être négatif !, faire une boucle de lecture.
    * appelant la fonction **volume_sphere** et affichant le résultat.<br>

==
before==
==
soluce==#|python|
from math import pi

def cube(n):
    return n ** 3

def volume_sphere(r):
    return 4 / 3 * pi * cube(r)

r = float(input("Entrez la valeur du rayon : "))
while r <0:
    r = float(input("Entrez la valeur du rayon : "))
    
print("Le volume de cette sphere vaut", volume_sphere(r))
==

mplsoluce0==
Positif_reel
10.4
==
mplsoluce1==
Negatif_reel
-5
2
==

mplsoluce2==
Nul
0
==










