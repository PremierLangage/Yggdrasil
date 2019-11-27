# ***************************************************************************
#                    EXEMPLE D'EXERCICE TROUVE FAUTE
# ***************************************************************************

extends=/Languages/French/Orthographe/Trouve_faute_template.pl

title=Ces ou ses : adjectif démonstratif ou possessif ?

author=Nicolas Borie

file_list==
["rules1.txt"]
==

@ /Languages/French/Orthographe/ses_ou_ces.txt [rules1.txt]

consecutive_to_validate = 3
recall_rule = True

