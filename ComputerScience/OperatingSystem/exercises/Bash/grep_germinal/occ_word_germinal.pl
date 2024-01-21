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

tag=bash|unix|terminal|grep|regex

before==#|python|
import random

things = [("mine", "73\n"), 
          ("maison", "115\n"), 
          ("charbon", "75\n"), 
          ("voiture", "25\n"), 
          ("père", "164\n"), 
          ("pain", "156\n")]
(name_thing, expected_stdout) = random.choice(things)
==

text==#|markdown|
Un fichier **Germinal.txt** a été placé dans le répertoire courant de travail. 
Établissez une **commande shell** qui affiche le nombre de fois que le mot 
**{{ name_thing }}** apparait dans le texte (au singulier ou au pluriel, avec 
une majuscule ou non). Débrouillez vous pour que votre résultat numérique soit 
affiché seul sur une ligne.
==

solution==
# EXO super dur !!!!!
# dépend de la question tirée
# Dans cet exo, les solutions sont hardcodées dans le builder
# voici une solution avec sed qui fait une ligne par mot : sale !
cat Germinal.txt | sed -e "s/\W/\n/g" | grep -c -e "^[cC]harbon$" -e "^[cC]harbons$"
cat Germinal.txt | sed -e "s/\W/\n/g" | grep -c -e "^[pP]ère[s]*$"
sed -e "s/\W/\n/g" Germinal.txt | grep -c -e "^[Mm]aison[s]*$"
==

