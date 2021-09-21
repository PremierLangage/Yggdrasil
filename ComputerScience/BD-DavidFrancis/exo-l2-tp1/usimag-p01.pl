extends = ../templates/exo-requete.pl

@ ../databases/script_usimag_lite.sql
@ ../databases/schema_usimag.txt
@ ../questions/questions_usimag.txt


#* titre de l'exercice
title = Question 1

author = Claire David

#* When True show the answer after timeout.
show_solution = False

#* When True display the reroll button and allow the student to reroll the exercice after tumeout
# TODO disable reroll is not implemented yet
allow_reroll =  True

#* script de definition d'énoncé et solution qui doit contenir
# ---
#   question : description en français de ce que doit calculer la requête 
#   solution : exemple de requête solution
#   fichier_bd : 'nom du fichier.sql' contenant la base de données sur laquelle on veut tester la réponse
#
#   optionnel :
#          numbered - boolean pour dire si le nombre de tuples de la réponse est important (distinct ou autre)
#                    False par défaut
#          ordered - boolean pour dire si l'ordre des tuples de la réponse est important (order by)
#                    False par défaut
#           maxattempt - nombre de tentatives 3 par défaut
generate== #|py|

import parse_question
import random

fichier_bd = 'script_soiree_lite.sql'
schema_bd = 'schema_soiree.txt'

question_dic = parse_question.question_to_dic("questions_soiree.txt")


chosen_question = random.choice(question_dic[1])

question = chosen_question.text

solution = chosen_question.answer

ordered = chosen_question.ordered

numbered = chosen_question.numbered

==



