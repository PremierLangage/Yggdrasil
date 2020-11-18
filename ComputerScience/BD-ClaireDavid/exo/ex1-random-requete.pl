extends = ../templates/exo-requete.pl


@ ../databases/script_soiree_lite.sql
@ ../databases/schema_soiree.sql

#* titre de l'exercice
title = Exercice test

#* Maximum number of attempts before showing the right answer.
maxattempt = 4

author = Nadime Francis

#* When True show the answer after timeout.
show_solution = False

#* When True display the reroll button and allow the student to reroll the exercice after tumeout
# TODO disable reroll is not implemented yet
allow_reroll =  True

#* script de definition d'énoncé et solution qui doit contenir
# ---
#   question : description en français de ce que doit calaculer la requête 
#   solution : exemple de requête solution
#   fichier_bd : 'nom du fichier.sql' contenant la base de données sur laquelle on veut tester la réponse
#
#   optionnel :
#          ordered - boolean pour dire si l'ordre des tuples de la réponse est important (order by)
#                    False par défaut
#           maxattempt - nombre de tentatives 3 par défaut
generate== #|py|

import parse_question
import random

fichier_bd = 'script_soiree_lite.sql'

## TODO mettre le schema qqpart? Dans un fichier séparé ou le générer (plus long)

question_dic = parse_question.question_to_dic("questions_soiree.txt")

ordered = False
### TODO? rajouter ordered dans le fichier question réponse? ou pas car ce n'est souvent pas pertinent

chosen_question = random.choice(question_dic[4])

question = chosen_question.text

solution = chosen_question.answer
==


#* Texte de l'énoncé
# ---
text== #|html|
On considère le schema suivant. Donnez une requete qui calcule {{ question }}. <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir la solution !
</p>
{% endif %}

==











