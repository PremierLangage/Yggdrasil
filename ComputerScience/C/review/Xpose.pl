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

==

title=Grille évaluation Exposés Techniques Avancés

text==

==

form==

==

evaluator==#|python|

note_finale = 100
feedback = "Voici la ligne de CSV pour votre évaluation"

grade = (note_finale, feedback)
==