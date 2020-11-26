# author DA

extends= /ComputerScience/python/AP1-1920/templates/prosoluce.pl
builder= /builder/before.py

@ /utils/sandboxio.py
@ /builder/before.py [builder.py]


title = Lecture de chaîne de caractères
text == 
Ecrire une fonction `read` prenant en paramètre une chaîne de caractères, et affichant chaque caractère de celle-ci succéssivement.
==


before==
soluce= presoluce
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




