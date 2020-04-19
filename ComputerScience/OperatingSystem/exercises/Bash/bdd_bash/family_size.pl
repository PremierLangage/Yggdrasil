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
title=Taille d'une famille donnée

before==#|python|
import random

experiences = [
("Fonsec", "24\n"),
("Roche", "16\n"),
("Coste", "22\n"),
("Afonso", "21\n"),
("Lamy", "13\n"),
("Brunet", "17\n"),
("Boyer", "20\n"),
("Bakri", "10\n"),
("Leroy", "14\n"),
]

instructions, expected_stdout = random.choice(experiences)

==

text==
Rappel de la structuration du fichier **MJC.txt**:   
<br />
**id:prénom:nom:age:activité lundi,activité mardi,...,activité dimanche:jour:mois:année**   
<br />

**Donnez le nombre de personnes membres de la MJC dans la famille 
{{ instructions }}.** Veuillez à faire en sorte que votre 
commande ne produise que l'affichage numérique seul sur une 
ligne. N'hésitez à faire plusieus essais.
==


