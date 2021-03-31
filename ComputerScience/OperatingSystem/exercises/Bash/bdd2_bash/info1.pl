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
title=Nombre de produits d'un type donné

before==#|python|
import random

experiences = [
("Plateau", "230\n"),
("Bougie", "241\n"),
("Serviette", "252\n"),
("Vase", "164\n"),
("Statuette", "254\n"),
("Coupe", "212\n"),
("Cadre photo", "182\n"),
("Coquetier", "247\n"),
("Main courrante", "196\n"),
("Horloge", "207\n"),
("Nappe", "213\n"),
("Arrosoir", "199\n")
]

instructions, expected_stdout = random.choice(experiences)

==


text==
Rappel de la structuration du fichier **item.txt**:   
<br />
**id;type;couleur;poids;quantité;jour;mois;année**   
<br />

**Établissez une commande qui affiche le nombre de produits de type {{ instructions }}**. 
Veuillez à faire en sorte que votre 
commande ne produise que l'affichage numérique seul sur une 
ligne (puis un retour à la ligne).
==

solution==
grep item.txt -e "Arrosoir" | wc -l
==
