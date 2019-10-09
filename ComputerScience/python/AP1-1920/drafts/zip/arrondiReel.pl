
#author=Zip


# Heritaged'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Approximation de $%\frac{\pi^2}{6}%$

code==
?? = int(input("Entrez un nombre : "))



print("avec(1)",??,"avec(2),??)

==

text==  
On veut comparer les valeurs de deux séries (identiques) qui convergent vers $%\frac{\pi^2}{6}%$


$%(1): \sum\limits_{i=1}^n\frac{1}{i}%$


$%\(2):\sum\limits_{n}^1 \frac{1}{i}%$
 

Ecrire un programme qui lit un entier positif n et affiche la somme 
pour chaque série (n non compris).

Si l'entier n est négatif, on affiche "erreur"
==

