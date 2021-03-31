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
title=Liste de produits d'une couleur donnée rajouté un mois donné

before==#|python|
import random

experiences = [
("or et rajoutés un mois de Janvier", "Coussin\nFleurs sechées\nMain courrante\nPorte journaux\nServiette\nToile cirée\n"),
]

instructions, expected_stdout = random.choice(experiences)

==

text==
Rappel de la structuration du fichier **item.txt**:   
<br />
**id;type;couleur;poids;quantité;jour;mois;année**   
<br />

**Établissez une commande qui affiche la liste triée des types de produits de couleur {{ instructions }}**. 
Veuillez à faire en sorte que votre commande ne produise que l'affichage seul 
avec un seul type de produit par ligne.
==

solution==

==


