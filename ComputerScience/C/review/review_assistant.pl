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
       "de code en langage C.\n<br />\n"
       "Commencez par vous présenter, précisez l'auteur du code reviewé ainsi qu'une description pour "
       "la production évaluée.",
       "## Avez-vous des derniers commentaires ou informations supplémentaires à donner ?"]

forms=['<table style="border-spacing: 30px; border-collapse: separate;">'
       '<tr><td>Votre <b>nom</b> (relecteur) </td><td> <input type=text id="form_nom" /> </td></tr>'
       '<tr><td>Nom de l\'<b>auteur</b> de la production </td><td> <input type=text id="form_author" /> </td></tr>'
       '<tr><td>Nom du code ou <b>projet</b> relu </td><td> <input type=text id="form_code" /> </td></tr>'
       '</table>',
       'Commentaires ouverts : <br /> '
       '<textarea id="form_comments" rows="6" cols="80" ></textarea>']

report=""

text=texts[step]
form=forms[step]
==

evaluator==#|python|
from datetime import date

mois=["janvier", "février", "mars", "avril", 
      "mai", "juin", "juillet", "août", 
      "septembre", "octobre", "novembre", "décembre"]

if (step == 0):
    report += "# Review de code\n\n"
    if len(response['code']) > 0:
        report += "Relecture de/du **"+response['code']+"**\n"
    if len(response['author']) > 0:
        report += "Projet/code produit par **"+response['author']+"**\n"
    report += "Relecture opérée"
    if len(response['nom']) > 0:
        report += " par **"+response['nom']+"**"
    report += " le "+str(date.today().day)+" "+mois[date.today().month - 1]+" "+str(date.today().year)
    report += "\n\n"
    step += 1
    text=texts[step]
    form=forms[step]
    grade=(-1, " ")
else:
    if len(response['comments']) > 0:
        report += "### derniers commentaires :\n" + response['comments']
    text=""
    form=""
    grade=(100, "C'est fini !<br /><br /><u><b>Rapport généré en markdown :</b></u><br /><br /><pre>"+report+"</pre>")

==

# the two following keys will be overwriten over and over...
text=""
form=""

