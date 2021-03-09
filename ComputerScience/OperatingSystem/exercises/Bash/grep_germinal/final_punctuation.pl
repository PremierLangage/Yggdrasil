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
title=Ponctuation finale des lignes de Germinal.

before==#|python|
import random

things = [("le nombre de lignes se terminant par un point d'interrogation", "190\n"),
          ("le nombre de lignes se terminant par un point d'exclamation", "375\n"),
          ("le nombre de lignes se terminant par un point", "2372\n")]
(name_thing, expected_stdout) = random.choice(things)
==

text==#|markdown|
Un fichier **Germinal.txt** (contenant le texte intégral de l'oeuvre de E. Zola) a 
été placé dans le répertoire courant de travail. Établissez une **commande shell** 
qui affiche **{{ name_thing }}** apparaissant dans le fichier. Débrouillez 
vous pour que votre résultat numérique soit affiché seul sur une ligne.
==

solution==
# dépend de la question tirée ! ? .
grep Germinal.txt -e "{!?.}$" | wc -l
==