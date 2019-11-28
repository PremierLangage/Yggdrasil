# ***************************************************************************
#      NE PAS MODIFIER CE FICHIER SOUS PEINE DE COUPS DE BATON
#             CE DERNIER EST EN DEMONSTRATION SUR LE WEB
# ***************************************************************************

extends=/Languages/French/Orthographe/Trouve_faute_template.pl

title=Deux règles d'orthographe

author=Nicolas Borie

file_list==
[ "ses_ou_ces.txt", "se_ou_ce.txt" ]
==

@ /Languages/French/Orthographe/ses_ou_ces.txt
@ /Languages/French/Orthographe/se_ou_ce.txt

consecutive_to_validate = 3 
recall_rule = True





