

extends = func.pl

funcname=deal
title= Distribution

doctest==

    la fonction  deal(deck, nb_cartes=5, nbjoueurs=4):

    Distribue nb_cartes cartes du deck a nbjoueurs 

    par défaut cela distribue 5 cartes a 4 joueurs

    retourne une liste de nbjoueurs listes de nb_cartes.

    **Attention il faut retirer les cartes du paquet (deck) une par une pour cela vous utiliserez la fonction pop().**
    
==

pltest==
>>> deal([('7', 'Coeur'), ('7', 'Carreau'), ('7', 'Trèfle'), ('7', 'Pique')],nb_cartes=2,nbjoueurs=2)
[[('7', 'Pique'), ('7', 'Trèfle')], [('7', 'Carreau'), ('7', 'Coeur')]]
>>> deal([('Valet', 'Coeur'), ('Valet', 'Carreau'), ('Valet', 'Trèfle'), ('Valet', 'Pique'), ('Dame', 'Coeur'), ('Dame', 'Carreau'), ('Dame', 'Trèfle'), ('Dame', 'Pique'), ('Roi', 'Coeur'), ('Roi', 'Carreau'), ('Roi', 'Trèfle'), ('Roi', 'Pique'), ('10', 'Coeur'), ('10', 'Carreau'), ('10', 'Trèfle'), ('10', 'Pique'), ('As', 'Coeur'), ('As', 'Carreau'), ('As', 'Trèfle'), ('As', 'Pique')]) # 5 cartes 4 joueurs
[[('As', 'Pique'), ('As', 'Trèfle'), ('As', 'Carreau'), ('As', 'Coeur'), ('10', 'Pique')], [('10', 'Trèfle'), ('10', 'Carreau'), ('10', 'Coeur'), ('Roi', 'Pique'), ('Roi', 'Trèfle')], [('Roi', 'Carreau'), ('Roi', 'Coeur'), ('Dame', 'Pique'), ('Dame', 'Trèfle'), ('Dame', 'Carreau')], [('Dame', 'Coeur'), ('Valet', 'Pique'), ('Valet', 'Trèfle'), ('Valet', 'Carreau'), ('Valet', 'Coeur')]] 
==

pltest2==
>>> deal([x for x in range(120)],nb_cartes=2, nbjoueurs=4):
[[119, 118], [117, 116], [115, 114], [113, 112]]
==