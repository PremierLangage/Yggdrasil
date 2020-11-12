extends = ../templates/exo-sql.pl

#* titre de l'exercice
title = Exercice test

#* Maximum number of attempts before showing the right answer.
maxattempt = 4

author = Claire David

#* When True show the answer after timeout.
show_solution = False

#* When True display the reroll button and allow the student to reroll the exercice after tumeout
# TODO disable reroll is not implemented yet
allow_reroll =  True

#* on peut ajouter ici un script de definition d'énoncé et solution qui sera excécuté dans le before de l'exo
generate== #|py|
# pour ajouter des fonctions dans un fichier .py
# ajouter le nom du fichier dans base.pl
# from monfichier import bla

import sqlite3

conn = sqlite3.connect('file:magasin.db?mode=ro', uri=True)


question = "Voilà ma question: c'était quoi déjà ?"

solution = "youpi"
==


#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text== #|html|
On considère le schema suivant. Donnez une requete qui calcule {{ question }}. <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir la solution !
</p>
{% endif %}

==

