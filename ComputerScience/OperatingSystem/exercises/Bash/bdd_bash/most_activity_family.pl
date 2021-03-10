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

tag=bash|unix|terminal|cut|grep|sort

before==#|python|
import random

experiences = [
("lundi", 
 "Anglais\nArt plastique\nChorale\nCinema\nCirque\nCouture\nCuisine\n"
 "Danse\nHistoire\nPiano\nSophrologie\nSport\nTheatre\nYoga\n"),
]

instructions, expected_stdout = random.choice(experiences)

==

text==#|markdown|
Rappel de la structuration du fichier **MJC.txt**:   
<br />
**id:prénom:nom:age:activité lundi,activité mardi,...,activité dimanche:jour:mois:année**   
<br />
**Étabilissez une commande qui affiche l'activité la plus pratiquée au sein de la famille
{{ instructions }}.** Veuillez à faire en sorte que votre 
commande (ou ensemble de commandes) ne produise que l'affichage demandé sans 
espace ou ligne en trop.
==

solution==
cut MJC.txt -d ':' -f 5 | cut -d ',' -f 5 | grep -v -e "^$" | sort -u
==


