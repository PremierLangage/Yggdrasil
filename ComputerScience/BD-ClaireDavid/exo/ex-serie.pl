extends = ../templates/exo-requete.pl

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

nb_questions = 2

questions = question_dic[nb_questions]

question1 = questions[1].text
solution1 = questions[1].answer

question2 = questions[2].text
solution2 = questions[2].answer
#question = chosen_question.text

#solution = chosen_question.answer
==














