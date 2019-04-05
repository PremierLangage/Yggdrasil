# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 

title= Produit d'une Liste d'entiers
tag= list|indices|slices
template=plbank:/python/0PLG/template
text==

Calcul du produit des éléments d'une liste d'entier.


ecrire une fonction pluspetit qui prend une liste en paramêtre et rerourne le produit des éléments.

Retourne 1 si la liste est vide.

==

code==

... produit ...


==

pltest==
>>> produit([12,45,78,1000,0,-100,])
0
>>> produit([12,45,78,100,])
4212000
>>> produit([])
1
>>> produit([12,45,78,1000,-100,])
-4212000000
==




