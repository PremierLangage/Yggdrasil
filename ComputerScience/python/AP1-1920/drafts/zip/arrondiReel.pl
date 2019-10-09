
#author=Zip


# Heritaged'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Approximation de $%\frac{\pi^2}{6}%$

code==
?? = int(input("Entrez un nombre : "))



print("avec(1)",??,"avec(2),??)

==

text==  
On veut comparer les valeurs  (informatique) de deux séries (identiques) qui convergent (mathématiquement) vers $%\frac{\pi^2}{6}%$


$%(1): \sum\limits_{i=1}^{+\infty}\frac{1}{i}%$


$%\(2):\sum\limits_{+\infty}^1 \frac{1}{i}%$
 

Ecrire un programme qui lit un entier positif n et calcule et affiche les sommes 
partielle (i=1 à n et i=n à 1, borne comprises) pour chaque série.

Si l'entier n est négatif, on affiche "erreur"
==

