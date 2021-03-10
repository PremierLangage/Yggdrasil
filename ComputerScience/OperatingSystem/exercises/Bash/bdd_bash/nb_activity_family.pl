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
title=Activités pratiquées dans une famille

tag=bash|unix|terminal|cut|grep|sort|wc

before==#|python|
import random

experiences = [
("Auber", "15\n"),
("Leroux", "10\n"),
("Klein", "11\n"),
("Perrin", "12\n"),
("Damiens", "7\n"),
("Besson", "13\n"),
("Robin", "9\n"),
("Kramer", "14\n"),
]

instructions, expected_stdout = random.choice(experiences)

==

text==#|markdown|
Rappel de la structuration du fichier **MJC.txt**:   
<br />
**id:prénom:nom:age:activité lundi,activité mardi,...,activité dimanche:jour:mois:année**   
<br />
**Étabilissez une commande qui affiche le nombre total d'activités différentes 
pratiquées au sein de la famille {{ instructions }}.** Veuillez à faire en sorte que votre 
commande (ou ensemble de commandes) ne produise que l'affichage demandé sans 
espace ou ligne en trop.
==

solution==
grep MJC.txt -e ".*:.*:Auber" | cut -d : -f 5 | sed -e "s/,/\n/g" | grep -v -e "^$" | sort -u | wc -l
==


