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

# Add the file containing integral text of Germinal by Zola
@ Germinal.txt

author=Nicolas Borie
title=Comptage d'occurences dans Germinal

before==
import random

things = [("mine", "73\n"), ("maison", "115\n"), ("charbon", "75\n")]
(name_thing, expected_stdout) = random.choice(things)
==

text==
Un fichier **Germinal.txt** a été placé dans le répertoire courant de travail. 
Établissez une **commande shell** qui affiche le nombre de fois que le mot 
**{{ name_thing }}** apparait dans le texte (au singulier ou au pluriel). Débrouillez 
vous pour que votre résultat numérique soit affiché seul sur une ligne. N'hésitez pas à
faire plusieurs essais.
==



