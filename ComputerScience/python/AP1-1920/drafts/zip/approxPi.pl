
#author=Zip


# Heritaged'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Approximation de $%\pi%$

code==
?? = int(input("Entrez un nombre : "))




print(??,"terme(s) inférieur(s) à",nb)

==

text==  
On veut comparer les valeurs de différentes séries qui convergent vers $%\pi%$

<

$%\pi =4 \times \Sigma\frac{(-1)^n}{2n+1}%$

et
$%\pi =8 \times \Sigma\frac{1}{(4k+1)(4k+3)}%$

Ecrire un programme qui lit un entier positif n et affiche la somme partielle
pour chaque série (de 0 à n compris).
Si l'entier n est négatif, on affiche "erreur"
==
