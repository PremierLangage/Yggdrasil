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
title=Activités suivies d'un membre connu par son Id

before==#|python|
import random

experiences = [
("583674581", ",,,,Art plastique,Cinema,\n"),
("756416762", "Danse,Cinema,,Histoire,,Piano,\n"),
("506271002", ",Danse,,,,,\n"),
("790235656", ",,,,,,\n"),
("78672237", "Cirque,,Cinema,Chorale,,Pate a sel,Couture\n"),
("728525218", "Theatre,,,Cuisine,Cinema,,\n"),
("565401605", ",,,,,,\n"),
("600823896", "Chorale,,Poterie,Chorale,,,\n"),
("431719037", ",,Poterie,Sophrologie,Art plastique,,Piano\n"),
("399388242", "Sophrologie,Theatre,Cinema,Cirque,,,Piano\n"),
]

instructions, expected_stdout = random.choice(experiences)

==

text==
Rappel de la structuration du fichier **MJC.txt**:   
<br />
**id:prénom:nom:age:activité lundi,activité mardi,...,activité dimanche:jour:mois:année**   
<br />

**Affichez le vecteur des activités suivies par le membre ayant l'Id 
{{ instructions }}.** Il faut selectionner dans la bdd la partie
`activité lundi, activité mardi, ..., activité dimanche` associé au bon 
membre (laissez les virgules). Veuillez à faire en sorte que votre 
commande ne produise que l'affichage demandé seul sur une 
ligne. N'hésitez à faire plusieus essais.
==


