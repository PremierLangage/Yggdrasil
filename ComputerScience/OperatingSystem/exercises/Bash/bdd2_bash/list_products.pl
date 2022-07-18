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

extends=/ComputerScience/OperatingSystem/templates/bash_template.pl

# Add the file containing the db of product items
@ item.txt

author=Nicolas Borie
title=Nombre de type de produits ayant une couleur

before==#|python|
import random

experiences = [
("jaune", "30\n"),
("vert", "32\n"),
("blanc", "31\n"),
("noir", "33\n"),
("rose", "34\n"),
]

instructions, expected_stdout = random.choice(experiences)

==


text==
Rappel de la structuration du fichier **item.txt**:   
<br />
**id;type;couleur;poids;quantité;jour;mois;année**   
<br />

**Établissez une commande qui affiche le nombre de type produits ayant la couleur {{ instructions }}**. 
Veuillez à faire en sorte que votre 
commande ne produise que l'affichage numérique seul sur une 
ligne (puis un retour à la ligne).
==


solution==
cut item.txt -d ';' -f 2,3 | grep -e "jaune" | cut -d ';' -f 1 | sort -u | wc -l
# autre version
grep item.txt -e ";vert;" | cut -d ";" -f 2 | sort -u | wc -l
==
