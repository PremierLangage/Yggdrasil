






extends = pltest2023.pl 

title= Test de pltest2023 
text==

Ce test a pour objectif de tester les capacités du model pltest2022.

En particulier les options #PL.



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

code ==
def f(n):
    return 2*n

k = f(6)
def g(p):
    return f(p-1)+f(p+1)

s='chaine'
==


testname0= Tests elementaires

pltest0==
>>> f(10) == 20
True
>>> f(12)
24
==


testname2=Tests de base sans commentaires
pltest2==
>>> def _hid(): pass#
>>> 'k' in globals()
True
>>> ('g' in globals()) and (type(g)== type(_hid))
True
>>> (type(f)== type(_hid)) and 'f' in globals()
True
==


testname1=Hidden Tests
pltest1==
>>> f(10) == 20#
True
>>> f(13)#
24
>>> 'k' in globals()#
True
>>> 'g' in globals() and type(g)=='function'  ## IL faut definir une fonction g. 
True
>>> 'errors' in globals() == True # errors a definir
==



