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
import random

experiences = [
("Listez dans l'ordre alphabétique toutes les activités pratiquées le mardi, une par ligne", "")
]

instructions, expected_stdout = random.choice(experiences)

==

text==
Un fichier **mjc.txt** a été placé dans votre répertoire courant de travail. 
Ce fichier est structuré de manière très sérieuse en ligne. Chaque ligne correspond à
un membre de la MJC de la capitale de la Syldavie. Chaque ligne suit la structure suivante :   
**id:prénom:nom:age:activité lundi,activité mardi,...,activité dimanche:jour:mois:année**   
À titre d'exemple, la première ligne du fichier est ainsi :   
**12137916:Daniel:Leroux:31:Theatre,,,,,,:12:Jun:2017**   
**Daniel Leroux** est donc le membre **12137916** de la MJC. Il a **31** ans et ne pratique que 
le **théâtre** le lundi ; les autres jours de la semaine, Daniel ne suit aucune activité. 
Daniel est membre de la MJC depuis le **12 Juin 2017**.


{{ instructions }}. Veuillez à faire en sorte que votre commande (ou ensemble de commandes)
ne produise que l'affichage demandé sans espace ou ligne en trop. N'hésitez à faire 
plusieus essais.
==




