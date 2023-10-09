extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl

title= Longueur chaine parité

text==
Ecrire une fonction **longueur_chaine_paire** qui vérifie le doctest suivant :

    La fonction longueur_chaine_paire(expr) renvoie True si la chaine expr est 
    de longueur paire, False sinon.

    >>> longueur_chaine_paire("au revoir")
    False
    >>> longueur_chaine_paire("fraternite")
    True


==

befor ==
==


editor.code==
==

pltest==
>>> longueur_chaine_paire("au revoir")
False
>>> longueur_chaine_paire("fraternite")
True
>>> longueur_chaine_paire("")
True
>>> longueur_chaine_paire("un")
True
==


soluce==
def longueur_chaine_paire(expr):
    return len(expr) % 2 == 0
==

