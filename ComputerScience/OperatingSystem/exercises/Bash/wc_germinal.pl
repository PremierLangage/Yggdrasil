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

@ Germinal.txt

author=Nicolas Borie
title=Comptage textuel dans Germinal

before==
import random

things = [("lignes", "6518\n"), ("mots", "165960\n"), ("caractères", "1030016\n")]
(name_thing, nb_thing) = random.choice(things)

==

text==
Un fichier **Germinal.txt** a été placé dans le répertoire courant de travail. 
Établissez une commande shell qui affiche le nombre de {{ name_thing }}. Débrouillez 
vous pour votre résultat numérique soit affiché seul sur une ligne. N'hésitez pas à
faire plusieurs essais.
==
