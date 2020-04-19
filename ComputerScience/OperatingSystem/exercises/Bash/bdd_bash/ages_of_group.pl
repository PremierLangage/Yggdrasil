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
title=Ages des personnes d'un groupe

before==#|python|
import random

experiences = [
("des membres portant le prénom Marise", 
 "6\n9\n10\n16\n26\n31\n32\n50\n51\n52\n63\n76\n86\n87\n95\n98\n"),
("des membres s'appelant Alice Peltier (toutes les homonymes)",
 "33\n97\n"),
('des membres portant le prénom de Marinette et ayant un nom de famille commençant par "Le"', 
 "17\n20\n63\n65\n96\n")
]

instructions, expected_stdout = random.choice(experiences)

==

text==
Rappel de la structuration du fichier **MJC.txt**:   
<br />
**id:prénom:nom:age:activité lundi,activité mardi,...,activité dimanche:jour:mois:année**   
<br />

**Affichez en ordre croissant l'ensemble des ages avec répétition possible 
(un age par ligne) {{ instructions }}.** N'hésitez à faire plusieus essais.
==


