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
title=Comptage des couples (prénom, nom) des homonymes

before==#|python|

expected_stdout = "111\n"
==

text==
Rappel de la structuration du fichier **MJC.txt**:   
<br />
**id:prénom:nom:age:activité lundi,activité mardi,...,activité dimanche:jour:mois:année**   
<br />

**Établissez une commande qui compte de nombre de couples (prénom, nom) 
tels que plusieurs personnes membres de la MJC portent ce nom et ce prénom.** 
Cela revient à lister tous les couples (prénom, nom) de la base de données puis à
ne selectionner que les lignes dupliqués. On termine en comptant ces lignes 
soigneusement selectionnées. Veuillez à faire en sorte que votre 
commande ne produise que l'affichage numérique seul sur une 
ligne. N'hésitez à faire plusieurs essais.
==


