# author DA

extends= /ComputerScience/python/AP1-1920/templates/prosoluce.pl
builder= /builder/before.py

title = Lecture de chaîne de caractères
text == 
Ecrire une fonction `read` prenant en paramètre une chaîne de caractères, et affichant chaque caractère de celle-ci succéssivement.
==

presoluce==
# solution
def read(s) :
    for c in s:
        print(c)

after=before
==

plsoluce==
le test
==




