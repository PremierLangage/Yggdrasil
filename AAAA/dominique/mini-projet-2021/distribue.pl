

extends = func.pl

funcname=deal
title= Distribution

doctest==

    la fonction  deal(deck, nb_cartes=5, nbjoueurs=4):

    Distribue nb_cartes cartes du deck a nbjoueurs 

    par défaut cela distribue 5 cartes a 4 joueurs

    retourne une liste de nbjoueurs listes de nb_cartes.

**Attention** il faut retirer les cartes du paquet (deck) une par une

pour cela vous utiliserez la fonction deck.pop(0).

==

pltest==
>>> deal([], ,nb_cartes=2,nbjoueurs=2)
>>> deal([('7', 'Coeur'), ('7', 'Carreau'), ('7', 'Trèfle'), ('7', 'Pique')],nb_cartes=2,nbjoueurs=2)
[[('7', 'Coeur'), ('7', 'Trèfle')], [('7', 'Carreau'), ('7', 'Pique')]]
>>> deal([('Valet', 'Coeur'), ('Valet', 'Carreau'), ('Valet', 'Trèfle'), ('Valet', 'Pique'), ('Dame', 'Coeur'), ('Dame', 'Carreau'), ('Dame', 'Trèfle'), ('Dame', 'Pique'), ('Roi', 'Coeur'), ('Roi', 'Carreau'), ('Roi', 'Trèfle'), ('Roi', 'Pique'), ('10', 'Coeur'), ('10', 'Carreau'), ('10', 'Trèfle'), ('10', 'Pique'), ('As', 'Coeur'), ('As', 'Carreau'), ('As', 'Trèfle'), ('As', 'Pique')]) # 5 cartes 4 joueurs
[[('Valet', 'Coeur'), ('Dame', 'Coeur'), ('Roi', 'Coeur'), ('10', 'Coeur'), ('As', 'Coeur')], [('Valet', 'Carreau'), ('Dame', 'Carreau'), ('Roi', 'Carreau'), ('10', 'Carreau'), ('As', 'Carreau')], [('Valet', 'Trèfle'), ('Dame', 'Trèfle'), ('Roi', 'Trèfle'), ('10', 'Trèfle'), ('As', 'Trèfle')], [('Valet', 'Pique'), ('Dame', 'Pique'), ('Roi', 'Pique'), ('10', 'Pique'), ('As', 'Pique')]]
==

pltest2==
>>> deal([1,2,3,4,5],nb_cartes=1, nbjoueurs=1)
[[5]]
>>> deal([x for x in range(120)],nb_cartes=2, nbjoueurs=4)
[[119, 118], [117, 116], [115, 114], [113, 112]]
==