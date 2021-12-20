




extends = func.pl

funcname=init_plateau
title= Initiation du plateau

doctest==

    la fonction init_plateau(n) retourne un tableau de n fois le
    même caractère "|".

==

pltest==
>>> belote_rebelote([('Roi', 'Carreau'), ('Roi', 'Coeur'), ('Dame', 'Pique'), ('Dame', 'Trèfle'), ('Dame', 'Carreau')],'Carreau')
True
>>> belote_rebelote([('Roi', 'Carreau'), ('Roi', 'Coeur'), ('Dame', 'Pique'), ('Dame', 'Trèfle'), ('Dame', 'Carreau')],'Pique')
False
==

