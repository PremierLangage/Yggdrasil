# OCE : test 11/09/2019 OK

# author=DR

title= Initialisation d'une variable (3).

tag=variable | affectation

text==

Initialisez les variables jour, mois, annee avec la date du jour.

==

@ /builder/before.py [builder.py]

before==
import datetime
d=datetime.datetime.now()
pltest="""
>>> jour #  le jour 
%d
>>> mois # le mois
%d
>>> annee # l'année 
%d
>>>
""" % (d.day, d.month, d.year)
==

code==

==

extends=/ComputerScience/python/template/pltest.pl







