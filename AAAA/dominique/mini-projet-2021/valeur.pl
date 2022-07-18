




extends = func.pl

funcname=value
title= Les points d'une carte 

doctest==

    la fonction value(card,atout)
    
    retourne la valeur de la carte pour l'atout atout.
    
==

pltest==
>>> value(('Valet', 'Carreau'),'Carreau')
20
>>> value(('9', 'Carreau'),'Carreau')
14
>>> value(('Valet', 'Carreau'),'Pique')
2
>>> value(('9', 'Carreau'),'Pique')
0
>>> value(('As', 'Carreau'),'Bof')
11
>>> value(('Dame', 'Carreau'),'Bof')
3
==