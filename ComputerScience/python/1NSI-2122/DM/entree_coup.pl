extends = /ComputerScience/python/template/pltest.pl

title= Entree du coup

text==


Ecrire une fonction **entree_coup** qui vérifie le doctest suivant :

    la fonction entree_coup(joueurs, joueur_actif, plateau, k) demande au joueur 
    actif combien il veut enlever d'alumettes. La saisie est contôlée en
    vérifiant que le coup est possible.

    exemple:
    >>> joueurs = entree_joueurs() 
    >>> joueurs
    ['Bob', 'Alice']

[https://www.belote.com/regles-et-variantes/les-regles-de-la-belote-classique/  ](https://www.belote.com/regles-et-variantes/les-regles-de-la-belote-classique/)

==


pltest==
>>> def coup_possible(nb_alumette, plateau,k):
...    if nb_alumette <= len(plateau) and nb_alumette <= k and nb_alumette > 0:
...        return True
...    else:
...        return False #
>>> from unittest.mock import patch #
>>> coup = entree_coup(['Bob', 'Alice'], 1, ['|', '|', '|', '|'], 3)
>>> coup
3
>>> def bonjour():
...    print("bonjour")
>>> bonjour()
==






