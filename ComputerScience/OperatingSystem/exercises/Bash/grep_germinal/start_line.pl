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
title=Information à extraire du texte de Germinal

before==
import random

things = [("le nombre de lignes vides", "3283\n"),
          ("le nombre de lignes commançant par une lettre majuscule", "1878\n"),
          ("le nombre de lignes commançant par un tiret (touche moins)", "1356\n")]
(name_thing, expected_stdout) = random.choice(things)
==

text==
Un fichier **Germinal.txt** (contenant le texte intégral de l'oeuvre de E. Zola) a 
été placé dans le répertoire courant de travail. Établissez une **commande shell** 
qui affiche **{{ name_thing }}** apparaissant dans le fichier. Débrouillez 
vous pour que votre résultat numérique soit affiché seul sur une ligne. N'hésitez pas à
faire plusieurs essais.
==



