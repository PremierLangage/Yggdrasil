
extends = func.pl

funcname=gagnant
title= Calcul du gagnant d'un plis

doctest==

La fonction gagnant(plis,atout) calcul la carte qui gagne et retourne l'indice de cette carte dans la liste plis.

Pour comparer deux cartes vous pouvez utiliser la fonction strength que vous avez déjà programmé (il faut la copier coler dans la réponse).

==

pltest==
>>> gagnant([('Valet', 'Carreau'), ('Valet', 'Trèfle'), ('Valet', 'Pique'), ('Dame', 'Coeur')],'Carreau')
0
>>> gagnant([('Valet', 'Carreau'), ('Valet', 'Trèfle'), ('Valet', 'Pique'), ('Dame', 'Coeur')],'Coeur')
3
>>> gagnant([('Valet', 'Carreau'), ('Valet', 'Trèfle'), ('Valet', 'Pique'), ('Dame', 'Coeur')],'Trèfle')
1
>>> gagnant([('Valet', 'Carreau')],'Trèfle')
0
==