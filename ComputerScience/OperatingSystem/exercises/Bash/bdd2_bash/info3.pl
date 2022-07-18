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
title=Liste de produits d'une couleur donnée rajouté un mois donné

before==#|python|
import random

experiences = [
("or et rajoutés un mois de Janvier", "Coussin\nFleurs sechées\nMain courrante\nPorte journaux\nServiette\nToile cirée\n"),
("argent et rajoutés un mois de Février", "Bougie\nCoquetier\nNappe\nServiette\nToile cirée\n"),
("taupe et rajoutés un mois de Mars", "Bougie\nDessous de plat\nÉtagère\nHorloge\nLampe\nMain courrante\nNappe\nPaillasson\nPlateau\nPorte journaux\n"),
("magenta et rajoutés un mois d'Avril", "Cadre photo\nChemin de table\nCoquetier\nCoupe\nÉtagère\nJardinière\nPorte serviette\nRideaux\nSerre livre\nTableau\nVase\n"),
("cyan et rajoutés un mois de Mai", "Arrosoir\nBougie\nCadre photo\nChemin de table\nCoquetier\nCoupe\nDessous de plat\nFigurine\nHorloge\nTableau\n"),
("saumon et rajoutés un mois de Juin", "Coquetier\nFigurine\nGuirlande\nHorloge\nLanterne\nPlante artificielle\nRideaux\nTableau\n"),
("parme et rajoutés un mois de Juillet", "Bougie\nChemin de table\nCoupe\nCoussin\nFigurine\nGuirlande\nMiroir\nPaillasson\nPorte journaux\nToile cirée\n"),
("chocolat et rajoutés un mois d'Août", "Bougie\nCoussin\nÉtagère\nJardinière\nLanterne\nNappe\nPlante artificielle\nPorte manteau\nSerre livre\n"),
("turquoise et rajoutés un mois de Septembre", "Bougie\nCoupe\nLanterne\nMiroir\nPlante artificielle\nRond de serviette\nStatuette\n"),
("pourpre et rajoutés un mois d'Octobre", "Arrosoir\nAssiette\nCoussin\nDessous de plat\nÉtagère\nPaillasson\nPorte serviette\nVase\n"),
("rose et rajoutés un mois de Novembre", "Arrosoir\nBougie\nCache pot\nCadre photo\nChemin de table\nCoussin\nDessous de plat\nGuirlande\nMain courrante\nNappe\nPaillasson\nPlante artificielle\nPorte serviette\nRideaux\nTableau\nToile cirée\n"),
("beige et rajoutés un mois de Décembre", "Arrosoir\nAssiette\nCache pot\nCoupe\nÉtagère\nFigurine\nFleurs sechées\nGuirlande\nNappe\nPaillasson\nPlante artificielle\nPorte manteau\nPorte serviette\nRond de serviette\nSerre livre\nTableau\nToile cirée\nVase\n"),
]

instructions, expected_stdout = random.choice(experiences)

==

text==
Rappel de la structuration du fichier **item.txt**:   
<br />
**id;type;couleur;poids;quantité;jour;mois;année**   
<br />

**Établissez une commande qui affiche la liste triée des types de produits de couleur {{ instructions }}**. 
Veuillez à faire en sorte que votre commande ne produise que l'affichage seul 
avec un seul type de produit par ligne.
==

solution==
# ça dépend du tirage, il y a 100 000 façon de faire
cut item.txt -d ';' -f 2,3,7 | grep -e ";or;Jan$" | cut -d ';' -f 1 | sort -u
# autre possibilité
grep item.txt -e ";Sep;" | grep -e ";turquoise;" | cut -d ';' -f 2 | sort -u
==


