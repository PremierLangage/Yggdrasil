
def entree_joueurs():
    joueurs=[]
    for i in range (2):
        joueur = input("Entrez le nom du joueur" + str(i))
        joueurs.append(joueur)
    return joueurs

@patch('builtins.input', lambda *args: 'y')


extends = func.pl

funcname= entree_joueurs
title= Victoire

doctest==
    la fonction entree_joueurs() demande le nom des deux joueurs
    et les retournent dans une liste

    exemple:
    >>> joueurs = entree_joueurs() 
    >>> joueurs
    ['Bob', 'Alice']
  
==

pltest==
>>> joueurs = entree_joueurs() 
>>> joueurs
['Bob', 'Alice']
==



