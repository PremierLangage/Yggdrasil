extends = pltest_before.pl
# extends = /ComputerScience/python/template/pltest.pl

title= Tour

befor==
def coup_possible(nb_alumette, plateau,k):
        if nb_alumette <= len(plateau) and nb_alumette <= k and nb_alumette > 0:
            return True
        else:
            return False

def entree_coup(joueurs, joueur_actif, plateau, k):
    coup = int(input(joueurs[joueur_actif] + " combien voulez vous en enlever"))
    while not coup_possible(coup, plateau, 3):
        coup = int(input(joueurs[joueur_actif] + " combien voulez vous en enlever"))
    return coup

def affiche_plateau(plateau):
    print(" ".join(plateau))

def jouer_coup(nb_alumette, plateau):
    for i in range(nb_alumette):
        plateau.pop()

def victoire(plateau):
    if len(plateau)==0:
        return True
    return False
==

text==


Ecrire une fonction **tour** qui vérifie le doctest suivant :

    la fonction tour(joueurs, joueur_actif, plateau, k) réalise un tour complet
    du jeu de nim:
     1. Demande à entrer un coup au joueur actif joueur_actif.
     2. Joue le coup choisi par le joueur actif.
     3. Affiche le plateau.
     4. Test si il y a une fin de jeu (victoire).
    Cette fonction retourne True si il y a une fin de jeu (victoire), False sinon.

    Considérez que toutes les fonctions précédemment demandées sont faites et 
    fonctionnent correctement

    exemple:
    >>> plateau = ['|', '|', '|', '|']
    >>> fin = tour(['Bob', 'Alice'], 1, plateau, 3)
    Alice combien voulez vous en enlever ? 5
    Impossible.
    Alice combien voulez vous en enlever ? 3
    >>> fin
    False
    >>> plateau
    ['|']
    >>> fin = tour(['Bob', 'Alice'], 0, plateau, 3)
    Bob combien voulez vous en enlever ? 1
    >>> fin
    True
    >>> plateau
    []


==



pltest==
>>> from unittest.mock import patch #
>>> plateau = ['|', '|', '|', '|'] #
>>> with patch('builtins.input', side_effect=['5', '3']):
...    fin = tour(['Bob', 'Alice'], 1, plateau, 3) #
>>> fin
False
>>> plateau
['|']
>>> with patch('builtins.input', side_effect=['1']):
...    fin = tour(['Bob', 'Alice'], 0, plateau, 3) #
>>> fin
True
>>> plateau
[]
==








