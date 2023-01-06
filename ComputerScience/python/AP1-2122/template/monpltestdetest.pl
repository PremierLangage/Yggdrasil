






extends = pltest2022.pl 

title= Test de pltest2022 
text==

Ce test a pour objectif de tester les capacités du model pltest2022.

En pariculier les options #PL.
==

editor.code ==
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
>>> 'g' in globals() == True and type(g)== 'function'
True
==


testname1=Hidden Tests
pltest1==
>>> f(10) == 20#
True
>>> f(12)#
24
>>> 'k' in globals()#
True
>>> 'g' in globals() and type(g)=='function'  ## IL faut definir une fonction g. 
True
>>> 'errors' in globals() == True # errors a definir
==



