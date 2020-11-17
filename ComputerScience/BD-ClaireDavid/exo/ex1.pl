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

fichier = open('script_soiree.sql','r')
script = ""

for line in fichier:
    script += line

conn = sqlite3.connect(":memory:")

fichier.close()

commande = 'INSERT INTO deguisement VALUES '

fichier = open('deguisement.sql','r')

for line in fichier:
    commande = commande + '(' + line + '),'

commande = commande[:-1] + ";"

cursor = conn.cursor()

cursor.executescript(script)
cursor.execute(commande)


cursor.execute('SELECT * FROM soiree;')
answer = cursor.fetchone()
append = str(answer)

question = "Voilà ma question: c'était quoi déjà ?" + append

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



