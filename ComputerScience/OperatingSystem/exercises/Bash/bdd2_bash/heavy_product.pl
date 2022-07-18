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
title=Trouver les produits les plus lourds

before==#|python|
import random

experiences = [
("de la lampe(Lampe) noire(noir) la plus lourde dont le poids est donné en kg", "12.6kg\n"),
("du vase(Vase) rose le plus lourd dont le poids est donné en kg", "15.1kg\n"),
("de la coupe(Coupe) marron la plus lourde dont le poids est donné en gr", "3900gr\n"),
("de l'horloge(Horloge) verte(vert) la plus lourde dont le poids est donné en gr", "3710gr\n"),
("de la bougie(Bougie) noire(noir) la plus lourde dont le poids est donné en gr", "3800gr\n"),
("du paillasson(Paillasson) beige le plus lourd dont le poids est donné en kg", "19.1kg\n"),
]

instructions, expected_stdout = random.choice(experiences)

==


text==
Rappel de la structuration du fichier **item.txt**:   
<br />
**id;type;couleur;poids;quantité;jour;mois;année**   
<br />

**Établissez une commande qui affiche le poids (avec son unité) {{ instructions }} **. 
Veuillez à faire en sorte que votre 
commande ne produise que l'affichage demandé seul sur une 
ligne (puis un retour à la ligne).
==

solution==
grep item.txt -e ";Horloge;" | grep -e ";vert;" | grep -e "gr;" | cut -d ';' -f 4 | sort -rn | head -1
==

