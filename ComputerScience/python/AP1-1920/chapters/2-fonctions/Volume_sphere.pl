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

L'objectif de cet exeercice est de calculer le volume
d'une sphère à l'aide de la formule
$%V=\frac{4}{3}{\pi}R^3%$. <br>
<br>

Pour cela, vous écrirez au moins deux fonctions :<br>

*   la fonction **cube**, qui retourne le cube d'un réel ;<br>

*   la fonction **volume_sphere** qui prends en paramètre un floattant `r`
    et retourne le volume de la sphere de rayon `r`
    en faisant appel à la fonction **cube**. <br>

Vous écrirez un programme demandant à un utilisateur
de rentrer un réel, appelant la fonction **volume_sphere**
et affichant le résultat.<br>
<br>

Voici un exemple complet d'éxécution du programme :<br>
`Entrez la valeur du rayon : 0.4`<br>
`Le volume de cette sphere vaut 0.26808257310632905`<br>
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











