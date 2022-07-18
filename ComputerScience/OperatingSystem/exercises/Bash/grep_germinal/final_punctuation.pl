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

tag=bash|unix|terminal|grep|regex

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
vous pour que votre résultat numérique soit affiché seul sur une ligne. Attention, 
**!** et **?** ne sont pas des caractères spéciaux pour les expressions régulières 
mais **.** en est un. Pour forcer un point, il faut soit le déspécialiser avec `\.`
ou encore le placer entre crochet `[.]` quand se dernier est inclus dans une 
expression régulière **Unix**.
==

solution==
# dépend de la question tirée ! ? .
# Dans cet exo, les solutions sont hardcodées dans le builder
grep Germinal.txt -e "{!?.}$" | wc -l
==