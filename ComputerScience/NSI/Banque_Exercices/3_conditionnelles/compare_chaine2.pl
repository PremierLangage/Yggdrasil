extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl

title= Compare chaine 

text==
Ecrire une fonction **compare_chaine** qui vérifie le doctest suivant :

    La fonction compare_chaine(expr1, expr2) renvoie la chaine la plus grande (au sens lexicographique (dictionnaire)) entre expr1 et expr2. 
    Si les deux chaines sont identiques, la fonction renvoie la chaine elle-même.

    >>> compare_chaine("au revoir", "bonjour")
    'bonjour'
    >>> compare_chaine("liberte", "bonjour")
    'liberte'


==

befor ==
==


editor.code==
==

pltest==
>>> compare_chaine("au revoir", "bonjour")
'bonjour'
>>> compare_chaine("liberte", "bonjour")
'liberte'
>>> compare_chaine("bon", "bonjour")
'bonjour'
>>> compare_chaine("bonjour", "bonjour")
'bonjour'
==


soluce==
def compare_chaine(expr1, expr2):
    if expr1 > expr2:
        return expr1
    else:
        return expr2
==
