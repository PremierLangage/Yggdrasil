# OCE : test 11/09/2019 OK

# author=DR

title= Initialisation d'une variable (3).

tag=variable | affectation

text==

Initialisez les variables jour, mois, annee avec la date du jour.

Utiliser un seul caractère = dans votre code en utisant le principe de l'affectation multiple.


Sur google Cherchez "python3 affectation multiple" 
==

@ /builder/before.py [builder.py]

before==
import datetime
d=datetime.datetime.now()
pltest0="""
>>> jour #  le jour 
%d
>>> mois # le mois
%d
>>> annee # l'année 
%d
>>>
""" % (d.day, d.month, d.year)
==

testname1="Affectation multiple"
pltest1==
>>> with open("student.py") as f:
...   s = f.read() #
>>> s.count("=") # Un seul égal dans la solution 
1
==





code==

==

extends=/ComputerScience/python/template/pltest.pl


editor.code==
# Ceci est un commentaire python 
==




