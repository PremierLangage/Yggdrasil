





extends = func.pl

funcname=strength
title= Strength : puissance d'une carte 

doctest==
Prend en parametre une carte et l'atout:
Retourne l'Ordre de la carte 'card' pour l'atout 'atout',
    à la couleur indice dans l'ordre des cartes dans la couleur
    à l'atout 100 + indice dans l'ordre des atouts

==


pltest==
>>> strength(('Valet', 'Carreau'),"pique")
3
>>> strength(('Valet', 'Carreau'),"Carreau")
107
>>> strength(('10', 'Carreau'),'Carreau')
104
>>> strength(('10', 'Carreau'),'Trèfle')
6
==