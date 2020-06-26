

author=DR
title= Jour de la semaine
tag=variable|str
text==


Intialisez la  variable *cejour* avec le nom de jour d'aujourd'hui:  
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
import datetime
l=['lundi','mardi','mercredi','jeudi','vendredi','samedi','dimanche']
cejour= l[datetime.datetime.today().weekday()]

pltest1="""
>>> cejour #  le jour  de la semaine est 
'%s'
""" % (cejour)
==

code==

==



extends=/ComputerScience/python/template/pltest.pl







