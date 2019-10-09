
#author=Zip


# Heritaged'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Approximation de $%\pi%$

code==
?? = int(input("Entrez un nombre : "))



print("avec(1)",??,"avec(2),??)

==

text==  
On veut comparer les valeurs de différentes séries qui convergent vers $%\pi%$


$%(1):\pi =4 \times \sum\limits_{i=0}\frac{(-1)^i}{2i+1}%$


$%\(2):\pi =3 + \sum\limits_{i=1}\frac{(-1)^{i+1}*4}{2i(2i+1)(2i+3)}%$
 
$%\(3):\pi =\sqrt(12)%$
Ecrire un programme qui lit un entier positif n et affiche la somme partielle
pour chaque série (n non compris).
Si l'entier n est négatif, on affiche "erreur"
==

