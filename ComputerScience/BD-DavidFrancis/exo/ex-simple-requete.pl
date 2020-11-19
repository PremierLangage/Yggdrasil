extends = ../templates/exo-requete.pl

@ ../databases/script_soiree_lite.sql
@ ../databases/schema_soiree.txt
@ ../questions/questions_soiree.txt

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
#   schema_bd : 'nom du fichier.txt' contenant la description du schema de la base de données sur laquelle on veut tester la réponse
#
#   optionnel :
#          ordered - boolean pour dire si l'ordre des tuples de la réponse est important (order by)
#                    False par défaut
#           maxattempt - nombre de tentatives 3 par défaut
generate== #|py|

ordered = True

fichier_bd = 'script_soiree_lite.sql'
schema_bd = 'schema_soiree.txt'

question = "La liste de toutes les personnes ayant au moins 12 ans avec tous leurs attributs de la plus âgée à la plus jeune."

solution = "SELECT * FROM personne where age >=12 ORDER BY age DESC;"
==


#* Texte de l'énoncé
# ---
text== #|html|
<p>On considère le schéma ci-dessous <br>
 {{schema |safe}}
 Ecrivez une requete SQL pour récupérer l'information suivante:<br>
 {{ question }}. <br> </p>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir la solution !
</p>
{% endif %}

==














