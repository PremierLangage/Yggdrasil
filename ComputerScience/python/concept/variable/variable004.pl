

author=DR
title= Jour de la semaine
tag=variable
text==


Intialisez la  variable *cejour* avec le bon nom de jour:  
lundi  
mardi  
mercredi  
jeudi  
vendredi  
samedi  
dimanche  
==

@ /builder/before.py [builder.py]


pltest0==#Déclaration
>>> "vous n'avez pas déclaré de variable cejour !" if "cejour" not in locals() or "cejour" not in globals() else "OK." # Déclaration de la variable cejour
'OK.'
==

before==
import time
import locale
locale.setlocale(locale.LC_ALL, 'fr_FR.utf8')

pltest2="""
>>> cejour #  le jour  de la semaine est 
%s
""" % (time.strftime('%a')
==

code==

==



extends=/ComputerScience/python/template/pltest.pl







