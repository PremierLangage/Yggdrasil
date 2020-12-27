#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie
title=Maximum générique d'une liste chaînée de personnes
tag=function|type|pointeur|function_pointer|difficile

text==
Écrire une fonction C **max_list** dont le prototype est presque le même que 
la fonction qsort. La 
fonction prendra donc en argument un tableau générique (son adresse, son nombre 
d'éléments puis la taille mémoire de chaque élément) mais aussi une fonction de 
comparaison. La fonction devra retourner l'index de l'élément minimal du tableau, 
selon la fonction de comparaison. Si le tableau est vide, votre fonction devra
retourner -1.

Pour rappel, une fonction de comparaison correcte vis à vis du langage C, 
évaluée sur des données X (premier argument) et Y (second argument) retourne un 
entier négatif, nul ou positif respectivement lorsque X < Y, X = Y ou X > Y.
Si la liste contient plusieurs occurences de son minimum, retournez l'adresse 
de la première cellule en partant de la tête qui réalise ce minimum.
==

editor.code==#|c|

==

solution==#|c|

==

code_before==#|c|

==

code_after==#|c|

==

checks_args_stdin==#|python|
[["Exécution simple", [], ""]]
==


