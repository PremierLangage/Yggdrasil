#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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
title=Activité la plus pratiquée un jour donné

tag=bash|unix|terminal|cut|sort|uniq|grep|sed|head|difficile

before==#|python|
import random

experiences = [
("lundis", "44\n"),
("mardis", "108\n"),
("mercredis", "93\n"),
("jeudis", "37\n"),
("vendredis", "119\n"),
("samedis", "95\n"),
("dimanches", "39\n"),
]

instructions, expected_stdout = random.choice(experiences)

==

text==#|markdown|
Rappel de la structuration du fichier **MJC.txt**:   
<br />
**id:prénom:nom:age:activité lundi,activité mardi,...,activité dimanche:jour:mois:année**   
<br />
**Étabilissez une commande qui affiche le nombre total de personnes participant à
l'activité la plus pratiquée les {{ instructions }}.** Veuillez à faire en sorte que votre 
commande (ou ensemble de commandes) ne produise que l'affichage demandé sans 
espace ou ligne en trop.
==

solution==
cut MJC.txt -d : -f 5 | cut -d ',' -f 7 | grep -v -e "^$" | sort | uniq -c | sort -nr | head -1 | sed -e "s/[^0-9]//g"
==



