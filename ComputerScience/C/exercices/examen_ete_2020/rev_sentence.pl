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
title=Renverser les mots d'une phrase
tag=function|string

text==
Écrire une fonction C **reverse_words** qui affiche le contenu de la phrase 
(une chaîne de caractères C) en argument mais les mots sont affichés dans 
l’ordre inverse. Placée dans un programme, voilà l’effet voulu :

    Platon@debian~$> ./a.out "La force tu dois ressentir!"
    ressentir! dois tu force La
    Platon@debian~$> ./a.out "Ça sert vraiment à rien les fonctions imaginées par le prof pour l'examen..."
    l'examen... pour prof le par imaginées fonctions les rien à vraiment sert Ça
    Platon@debian~$> ./a.out "Plus il y a de fous, plus on rit!"
    rit! on plus fous, de a y il Plus

Les mots sont délimités par des espaces. On ne touche pas aux majuscules 
et minuscules et la ponctuation, quand elle existe, est portée par les mots 
auquels elle est accolée.
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
[["Exécution simple", [], "deux mot."]]
==


