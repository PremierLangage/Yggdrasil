extends=/ComputerScience/python/template/qcm_template.pl

title = Quelle est la définiton de la moyenne ?

text= Cochez les affirmations correctes

# ceci est un commentaire dans l'exercice
# nombre de propositions
nb=4
# nombre de réponses vraies
# si nbtrues==0: un nombre aléatoire entre 1 et nb
# si pas défini: un nombre aléatoire de réponses à cocher
nbtrues=1

good==
la valeur qu'on obtiendrait si toutes les valeurs de l'échantillon étaient égales
Le centre de gravité de la distribution d'une variable numérique sur un échantillon
Le rapport entre la somme des observations et le nombre des observations
Le total des observations sur le nomre d'observations

==

delimiter=$

bad==
La modalité partageant en deux parties égales la distribution des observations | Non, c'est la médiane.
Le carré des écarts à la note maximale | Je ne sais pas non plus ce que cela représente. 
La note qu'on obtiendrait si on a bien travaillé | Non, ça c'est la moyenne scolaire. 
Le score réalisé par une majorité de sujets | Non, ça c'est le mode.
==


feedback=show










