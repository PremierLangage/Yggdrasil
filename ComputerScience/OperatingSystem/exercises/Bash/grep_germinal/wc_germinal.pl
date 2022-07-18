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
title=Comptage textuel dans Germinal

tag=bash|unix|terminal|wc

before==#|python|
import random

things = [("de lignes", "6518\n"), ("de mots", "165960\n"), ("d'octets", "1030016\n")]
(name_thing, expected_stdout) = random.choice(things)
==

text==#|markdown|
Un fichier **Germinal.txt** a été placé dans le répertoire courant de travail. 
Établissez une **commande shell** qui affiche le nombre **{{ name_thing }}**. Débrouillez 
vous pour que votre résultat numérique soit affiché seul sur une ligne. Le nom du fichier ne 
doit pas être répété, il faudra juste produire l'affichage de la grandeur numérique.
==

solution==
# depend de la question tirée lwc : ligne, mot ou caractère
cat Germinal.txt | wc -{lwc}
==