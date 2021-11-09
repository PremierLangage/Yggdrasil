




extends = func.pl

funcname=belote_rebelote
title= J'ai la belote !!

doctest==

    la fonction belote_rebelote(deck,atout="Pique")

    Retourne si les deux cartes Dame et Roi d'atout sont dans le jeu 'deck' (liste de cartes).

==

pltest==
>>> belote_rebelote([('Roi', 'Carreau'), ('Roi', 'Coeur'), ('Dame', 'Pique'), ('Dame', 'Trèfle'), ('Dame', 'Carreau')],'Carreau')
True
>>> belote_rebelote([('Roi', 'Carreau'), ('Roi', 'Coeur'), ('Dame', 'Pique'), ('Dame', 'Trèfle'), ('Dame', 'Carreau')],'Pique')
False
==
