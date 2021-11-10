





extends = func.pl

funcname=strength
title= Strength : puissance d'une carte 

doctest==
Prend en parametre une carte et l'atout:
Retourne l'Ordre de la carte 'card' pour l'atout 'atout',
    à la couleur indice dans l'ordre des cartes dans la couleur
    à l'atout 100 + indice dans l'ordre des atouts

[https://www.belote.com/regles-et-variantes/les-regles-de-la-belote-classique/  ](https://www.belote.com/regles-et-variantes/les-regles-de-la-belote-classique/)
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