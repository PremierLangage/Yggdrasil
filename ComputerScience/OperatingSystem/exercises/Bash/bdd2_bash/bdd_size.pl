#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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
title=Nombre de produits dans la base de données

before==#|python|

expected_stdout = "7248\n"
==

text==#|markdown|
On souhaite maintenant extraire des informations de la base de produits, elle aussi 
donnée sous la forme d'un fichier structuré par lignes.

Rappel de la structuration du fichier **item.txt**:   
<br />
**id;type;couleur;poids;quantité;jour;mois;année**   
<br />


**Établissez une commande qui affiche le nombre de produits dans la base de données**. 
Veuillez à faire en sorte que votre 
commande ne produise que l'affichage numérique seul sur une 
ligne (puis un retour à la ligne).
==

solution==#|shell|
cat item.txt | wc -l
==

