

extends=/ComputerScience/python/template/pltest.pl
@ /utils/sandboxio.py

title= "Test de pltest2023"

before==

==

statement==

Ce test a pour objectif de tester les capacités du model pltest2022.

En particulier la portabilité des exercices depuis Premier Langage.

{{grade}}
==

Xstatement==


Voici les tests réalisés:

pltest0 = """

<verb>{{pltest0 | replace('\n','<br>') | safe}}</verb>

"""

Test cachés il y a un commentaire vide en fin de ligne ou le commentaire se termine par un # :

pltest1 =
"""

 {{pltest1| replace('\n','<br>') | safe}}

"""
Tests standard:
pltest2 = 
"""

{{pltest2| replace('\n','<br>') | safe}}

"""
==

editor.code ==
def f(n):
    return 2*n

k = f(6)
def g(p):
    return f(p-1)+f(p+1)

s='chaine'
==


testname0= "Tests basiques"
pltest0==
>>> f(10) == 20
True
>>> f(12)
24
==

testname1="Hidden Tests"
pltest1==
>>> f(10) == 20#
True
>>> f(12)#
24
>>> 's' in globals()#
True
==
