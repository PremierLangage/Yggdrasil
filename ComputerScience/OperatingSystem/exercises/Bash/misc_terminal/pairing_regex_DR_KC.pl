#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

extends = /model/matchlist/matchlist.pl

author=Nicolas Borie
title=Recherches à l'intérieur des fichiers

tag=grep|regex|expression régulière|terminal|unix

text==#|markdown|
Relier les expressions régulières à droites avec ce que pourrait obtenir un 
utilisateur en terminal unix en les branchant correctement dans un bon appel 
à **grep**.

<br>

Attention, comme dans la théorie des langages, l'étoile signifie maintenant 
toutes répétitions (possiblement vide) du pattern qui le précède. L'étoile des 
méta-caractères n'est pas la même que l'étoile des expressions régulières.
==

pairs==
`^[a-z]*$`§lignes composées que de lettres minuscules
`[1-9][0-9][0-9]`§lignes contenants un nombre compris entre 100 à 999
`[A-H][1-8]`§lignes contenant l'index d'une case d'échiquier
`^[aeiouy]*$`§lignes composées que de voyelles
`^[^0-9]*$`§lignes sans aucun chiffre
==

