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
@ mjc.txt

author=Nicolas Borie
title=Base de données primitive en bash

before==#|python|


exp = [
("", "")
]

expected_stdout=""

==

text==
Un fichier **mjc.txt** a été placé dans votre répertoire courant de travail. 
Ce fichier est structuré de manière très sérieuse en ligne. Chaque ligne correspond à
un membre de la MJC de la capitale de la Syldavie. Chaque ligne suit la structure suivante : \   
**id** : **prénom** 
==



