



extends = func.pl

funcname=comptepoints
title= Compte du nombre de points des plis gagnés 

doctest==

La fonction comptepoints(pliss, atout ,dixdeder=0) retourne le nombre de points contenu dans une liste de plis.
Chaque plis étant une liste de cartes.

Utilisez la fonction **valeur** que vous avez déjà écrite.

Ajouter la valeur de dixdeder.
==

pltest==
>>> HEIGTH= ( "7", "8", "9","Valet", "Dame", "Roi", "10","As") #
>>> COLOR= ("Coeur", "Carreau", "Trèfle", "Pique") # 
>>> HEIGTHA= ( "7", "8", "Dame", "Roi", "10", "As", "9", "Valet") #
>>> comptepoints([(h,c) for h in HEIGTH for c in COLOR],"pique",10)
130
>>> comptepoints([(h,c) for h in HEIGTH for c in COLOR],"Pique",10)
162
==

