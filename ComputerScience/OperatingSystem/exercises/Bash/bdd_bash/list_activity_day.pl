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
title=Résumé de l'activité de la MJC sur 1 jour

tag=bash|unix|terminal|cut|sort|uniq|grep

before==#|python|
import random

experiences = [
("lundis", 
 "    44 Danse\n    41 Piano\n    36 Theatre\n    35 Chorale\n    34 Yoga\n    34 Sophrologie\n"
 "    32 Art plastique\n    31 Histoire\n    30 Cirque\n    29 Anglais\n    27 Sport\n    27 Cuisine\n"
 "    24 Couture\n    20 Cinema"),
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



