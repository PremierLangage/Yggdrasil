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

extends=/ComputerScience/OperatingSystem/templates/bash_template.pl

# Add the file containing the db of product items
@ item.txt

author=Nicolas Borie
title=Le jour avec le plus d'ajouts

before==#|python|

expected_stdout = "Dec\n"
==


text==
Rappel de la structuration du fichier **item.txt**:   
<br />
**id;type;couleur;poids;quantité;jour;mois;année**   
<br />

Durant quel mois, la base de données a connu le jour durant lequel 
le plus de nouveaux produits ont été ajoutés à cette dernière. 
Il faut donc trouver ce jour (12 poduits ont été rajoutés à la bdd 
ce jour-là) puis juste afficher le mois associé à ce jour 
(septième champs des lignes).

==

solution==
cut item.txt -d ';' -f 6,7,8 | sort | uniq -c | sort -rn | head -1 | cut -d ';' -f 2
==

