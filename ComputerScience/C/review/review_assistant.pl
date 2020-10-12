#*****************************************************************************
#  Copyright (C) 2017 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# author=Nicolas Borie

title=Assistant générateur de rapport de review de code
tag=review|code|relecture|validation|correction|évaluation|pairs

before==#|python|

# step index 
step = 0

# Les énoncés
texts=["## Bienvenu sur l'assistant online d'aide à la génération de rapport pour la review "
       "de code en langage C.\n\n   "
       "Commencez par vous présenter, précisez l'auteur du code reviewé ainsi qu'une description pour "
       "la production évaluée.",
       "## Avez-vous des derniers commentaires ou informations supplémentaires à donner ?"]

forms=["Votre nom (relecteur) : <input type=text /> <br />"
        "Nom de l'auteur de la production : <input type=text /> <br />"
        "Nom du code ou projet relu : <input type=text />",
        "Commentaires ouverts : <textarea></textarea>"]

report=""

text=texts[step]
form=forms[step]
==

evaluator==#|python|
if (step < 1):
    step += 1
    text=texts[step]
    form=forms[step]
    grade=(-1, " ")
else:
    text=""
    form=""
    grade=(100, "C'est fini !")

==

# the two following keys will be overwriten over and over...
text=""
form=""

