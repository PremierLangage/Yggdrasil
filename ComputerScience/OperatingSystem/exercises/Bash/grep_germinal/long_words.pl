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
title=Lister des mots très longs dans germinals

before==
import random

things = [
("la liste triée sans répétition des mots en minuscules de 17 lettres", 
 "embroussaillaient\nperfectionnements\nphilosophiquement\n"),
("la liste triée sans répétition des mots en minuscules de 19 lettres",
 "proportionnellement\nrévolutionnairement\n"),
("la liste triée sans répétition des mots en minuscules de 16 lettres",
 "applaudissements\nconcessionnaires\ndébarbouillerait\ndébarbouillerons\n" 
 "fonctionneraient\nincompréhensible\nmélancoliquement\nparticulièrement\n"
 "ragaillardissait\nrespectueusement\nrévolutionnaires\nscientifiquement\n") 
]
(name_thing, expected_stdout) = random.choice(things)
==

text==
Un fichier **Germinal.txt** (contenant le texte intégral de l'oeuvre de E. Zola) a 
été placé dans le répertoire courant de travail. Établissez une **commande shell** 
qui affiche **{{ name_thing }}** apparaissant dans le fichier. Débrouillez 
vous pour que votre résultat numérique soit affiché seul sur une ligne. N'hésitez pas à
faire plusieurs essais.
==



