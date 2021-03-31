#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

extends=/ComputerScience/OperatingSystem/templates/bash_template.pl

# Add the file containing the db of product items
@ item.txt

author=Nicolas Borie
title=Nombre de produits d'une couleur donnée et ajoutés une certaine année

before==#|python|
import random

experiences = [
("noir rajoutés en 2019", "186\n"),
("blanc rajoutés en 2018", "102\n"),
("rouge rajoutés en 2017", "32\n"),
("bleu rajoutés en 2016", "28\n"),
("vert rajoutés en 2015", "20\n"),
("jaune rajoutés en 2014", "15\n"),
("violet rajoutés en 2013", "9\n"),
("rose rajoutés en 2012", "13\n"),
("pourpre rajoutés en 2011", "3\n"),
("gris rajoutés en 2010", "25\n"),
("saumon rajoutés en 2009", "2\n"),
("cyan rajoutés en 2008", "5\n"),
("beige rajoutés en 2007", "9\n"),
("orange rajoutés en 2006", "17\n"),
("argent rajoutés en 2005", "3\n"),
]

instructions, expected_stdout = random.choice(experiences)

==

text==
Rappel de la structuration du fichier **item.txt**:   
<br />
**id;type;couleur;poids;quantité;jour;mois;année**   
<br />

**Établissez une commande qui affiche le nombre de produits de couleur {{ instructions }}**. 
Veuillez à faire en sorte que votre 
commande ne produise que l'affichage numérique seul sur une 
ligne (puis un retour à la ligne).
==

solution==
grep item.txt -e ";bleu;" | grep -e ";2016$" | wc -l
==

