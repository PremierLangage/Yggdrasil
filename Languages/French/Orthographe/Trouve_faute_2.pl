# ***************************************************************************
#                    EXEMPLE D'EXERCICE TROUVE FAUTE
#
# Pour faire un exercice tu type Trouve_faute_template.pl, il faut commencer
# par faire un copier-coller de tout ce suit dans un nouveau fichier 
# fraichement créé.
#
# Vous pouvez faire travailler les élèves sur autant de règles que vous
# voulez en rajoutant des fichiers d'exercices dans file_list et aussi
# après un arobase @
#
# En donnant d'autres valeurs aux variables consecutive_to_validate ou encore
# nb_good_to_validate, vous pouvez adapter vous-même la validation 
# d'acquisition de la maitrise des règles d'orthographe par les apprenants.
#
# ***************************************************************************

extends=/Languages/French/Orthographe/Trouve_faute_template.pl

title=Ces ou ses : adjectif démonstratif ou possessif ?

author=Nicolas Borie

file_list==
["ses_ou_ces.txt", "se_ou_ce.txt"]
==

@ /Languages/French/Orthographe/ses_ou_ces.txt
@ /Languages/French/Orthographe/se_ou_ce.txt

# l'apprenant doit appliquer 3 fois justement et consécutivement 
# la règle pour la vaider.
consecutive_to_validate = 3 
# Un rappel de la règle à apprendre sera fait avant l'exercice.
# En mettant cette variable à False, le rappel sera supprimer
recall_rule = True



