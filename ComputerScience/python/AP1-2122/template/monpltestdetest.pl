






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

stopfirsterror= False



testname0=Tests de base sans commentaires
pltest0==
>>> def _hid(): pass#
>>> 'g' in globals() == True and type(g)== type(_hid) # IL faut definir une fonction g. #
>>> f(10) == 2
True
>>> f(12)
24
>>> 'k' in globals()
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
>>> 'g' in globals() and type(g)=='function' #
True
==



