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
title=Produit dominant sur une couleur durant une année

before==#|python|
import random

experiences = [
("en 2010 et de couleur noir", "Rideaux\n"),
("en 2009 et de couleur noir", "Coussin\n"),
("en 2008 et de couleur blanc", "Plateau\n"),
("en 2007 et de couleur beige", "Jardinière\n"),
("en 2006 et de couleur rouge", "Statuette\n"),
("en 2005 et de couleur chocolat", "Vase\n"),
("en 2004 et de couleur blanc", "Lampe\n"),
("en 2000 et de couleur noir", "Étagère\n"),
("en 2011 et de couleur blanc", "Guirlande\n"),
("en 2012 et de couleur orange", "Coupe\n"),
("en 2014 et de couleur parme", "Serviette\n"),
("en 2015 et de couleur gris", "Coussin\n"),
("en 2016 et de couleur blanc", "Statuette\n"),
]

instructions, expected_stdout = random.choice(experiences)

==


text==
Rappel de la structuration du fichier **item.txt**:   
<br />
**id;type;couleur;poids;quantité;jour;mois;année**   
<br />

**Établissez une commande qui affiche le type de produit le plus nombreux ajouté {{ instructions }}**. 
Veuillez à faire en sorte que votre 
commande ne produise que l'affichage du type de produit seul sur une 
ligne (puis un retour à la ligne).
==


solution==
grep item.txt -e ";2010$" | grep -e ";noir;" | cut -d ';' -f 2 | sort | uniq -c | sort -rn | head -1 | sed -e 's/[^a-zA-Z]//g'
==

