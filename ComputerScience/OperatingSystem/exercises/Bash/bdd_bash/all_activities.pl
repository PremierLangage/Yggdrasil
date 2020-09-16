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
title=Liste de toutes les activités pratiquées

before==#|python|

expected_stdout = "Anglais\nArt plastique\nChorale\nCinema\nCirque\nCouture\nCuisine\nDanse\nHistoire\nPate a sel\nPiano\nPoterie\nSophrologie\nSport\nTheatre\nYoga\n"
==

text==
Rappel de la structuration du fichier **MJC.txt**:   
<br />
**id:prénom:nom:age:activité lundi,activité mardi,...,activité dimanche:jour:mois:année**   
<br />

**Listez l'ensemble de toutes les activités pratiquées à la MJC peu importe 
le jour. Ordonner ces activités alphabétiquement, une par ligne.** N'hésitez 
à faire plusieurs essais.
==


