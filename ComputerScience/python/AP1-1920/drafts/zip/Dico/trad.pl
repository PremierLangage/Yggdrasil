
# author zip
# Heritage d'un type d'exercice
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = traduction approximative
text== 
Ecrire une fonction `traduit` qui reçoit un dictinnaire et un texte sous forme d'une 'str'
les clef et lesvaleur du dictinnaire sont des str.
La fonction remplace chaque clef du texte présente dans le dictionnaire par la valeur associé 
 >>>  `traduit({'tailleur':'taylor','riche':'rich','tu':'you','mon':'my','est':'is'},'eh mon tailleur est riche sur ')
eh my taylor is rich sur
==
