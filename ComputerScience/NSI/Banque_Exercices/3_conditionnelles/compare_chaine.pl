extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl

title= Compare longueur chaine 

text==
Ecrire une fonction **compare_chaine** qui vérifie le doctest suivant :

    La fonction compare_chaine(expr1, expr2) renvoie la chaine la plus longue entre expr1 et expr2. 
    Si les deux chaines sont de même longueur, la fonction renvoie None

    >>> compare_chaine("au revoir", "bonjour")
    'au revoir'
    >>> compare_chaine("liberte", "bonjour")
    None


==

befor ==
==


editor.code==
==

pltest==
>>> compare_chaine("au revoir", "bonjour")
'au revoir'
>>> compare_chaine("liberte", "bonjour")
>>> compare_chaine("", "bonjour")
'bonjour'
==


soluce==
def compare_chaine(expr1, expr2):
    if len(expr1) > len(expr2):
        return expr1
    elif len(expr1) < len(expr2):
        return expr2
==