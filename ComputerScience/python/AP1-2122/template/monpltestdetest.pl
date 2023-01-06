






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
>>> if g: pass # Vous devez définir une fonction g #
>>> f(10) == 20 ##
True
>>> f(12)
24
>>> 'k' in globals() #
True
>>> 'g' in globals() # Vous devez définir une fonction g #
True
==


# si aucun test du groupe n'echoue il n'y aura aucun affichage.
# car ils sont tous hidden (terminé par #).
testname1=Hidden Tests
pltest1==
>>> f(10) == 20 #
True
>>> f(12)#
24
>>> 'k' in globals()#
True
>>> 'g' in globals() # Vous devez définir une fonction g #
True
>>> 'errors' in globals() #
True
>>> 'errors' in globals() # Vous devez definir une variable errors #
True
==



