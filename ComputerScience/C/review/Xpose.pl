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

author=The ESIPE Dream Team !

@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py


before==#|python|

students = [ ("AGULLO", "Vincent"),
             ("BATICLE", "Nicolas"),
             ("BESSODES", "Julien"),
             ("BOHL", "Kylian"),
             ("BOURJOT", "Raphaël"),
             ("CAU", "Guillaume"),
             ("CRETE", "Jonathan"),
             ("DA COSTA", "Mélissa"),
             ("DESCOMBES", "Anaïs"),
             ("DINDANE", "Chahinaz"),
             ("DURAND", "Axel"),
             ("FALL", "Abdou"),
             ("FAU", "Nicolas"),
             ("JOLIVET", "Dylan"),
             ("JOLIVET", "Yohann"),
             ("KHEROUA", "Karim"),
             ("KOFFI", "Judicaël"),
             ("LEMOINE", "Nathan"),
             ("MARSZAL", "Rémi"),
             ("MARTI", "Emilie"),
             ("MARTIN", "Kevin"),
             ("MATHECOWITSCH", "Guillaume"),
             ("MECHOUK", "Lisa"),
             ("MERCHERMEK", "Salim"),
             ("NGUYEN", "Christelle"),
             ("OUCH", "Léo"),
             ("OUZIEL", "Sacha"),
             ("PERNET", "Nils"),
             ("QUANTIN", "Benoît"),
             ("SICOT", "Yoann"),
             ("SORAN", "Altan"),
             ("SOUSTRE", "Ludovic"),
             ("TRAINA", "Tanguy"),
             ("WINCKLER", "Jean-Philippe") ]

==

title=Grille évaluation Exposés Techniques Avancés

text==
Pas de papier cette année! Nous allons économiser (34 + 6)*3 feuilles A4 pour
les évaluations. En contrepartie, vous devrez chacun, et chaque semaine, envoyer 
un mail à **nicolas.borie@univ-eiffel.fr** avec les 4 lignes CSV générés par cet utilitaire 
après chaque présentation et assemblées par vos soins.



==

form==

==

evaluator==#|python|

note_finale = 100
feedback = "Voici la ligne de CSV pour votre évaluation"

grade = (note_finale, feedback)
==