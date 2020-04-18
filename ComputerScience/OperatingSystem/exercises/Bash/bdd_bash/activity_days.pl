#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of the GNU General Public License (GPL)
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#    General Public License for more details.
#
#  The full text of the GPL is available at:
#
#                  http://www.gnu.org/licenses/
#*****************************************************************************

extends=/ComputerScience/OperatingSystem/templates/bash_template.pl

# Add the file containing the db of the "maison des jeunes et de la culture"
@ MJC.txt

author=Nicolas Borie
title=Extraction des activités d'un jour donné

before==#|python|
import random

experiences = [
("lundi", 
 "Anglais\nArt plastique\nChorale\nCinema\nCirque\nCouture\nCuisine\n"
 "Danse\nHistoire\nPiano\nSophrologie\nSport\nTheatre\nYoga\n"),
("mardi", 
 "Art plastique\nCinema\nDanse\nTheatre\n"),
("mercredi", 
 "Cinema\nHistoire\nPate a sel\nPiano\nPoterie\n"),
("jeudi", 
 "Anglais\nArt plastique\nChorale\nCinema\nCirque\nCouture\nCuisine\n"
 "Danse\nHistoire\nPiano\nSophrologie\nSport\nTheatre\nYoga\n"),
("vendredi", 
 "Art plastique\nCinema\nDanse\nTheatre\n"),
("samedi", 
 "Cinema\nHistoire\nPate a sel\nPiano\nPoterie\n"),
("dimanche", 
 "Anglais\nArt plastique\nChorale\nCinema\nCirque\nCouture\nCuisine\n"
 "Danse\nHistoire\nPiano\nSophrologie\nSport\nTheatre\nYoga\n")
]

instructions, expected_stdout = random.choice(experiences)

==

text==
Rappel de la structuration du fichier **MJC.txt**:   
<br />
**id:prénom:nom:age:activité lundi,activité mardi,...,activité dimanche:jour:mois:année**   
<br />

**Listez dans l'ordre alphabétique toutes les activités qui sont pratiquées le 
{{ instructions }} à la MJC, une par ligne.** Veuillez à faire en sorte que votre 
commande (ou ensemble de commandes) ne produise que l'affichage demandé sans 
espace ou ligne en trop. N'hésitez à faire plusieus essais.
==





