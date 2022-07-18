extends = pltest_before.pl
# extends = /ComputerScience/python/template/pltest.pl

title= Jeu de Nim complet

befor==
def init_plateau(n):
    plateau = ["|"] * n
    return plateau

def entree_joueurs():
    joueurs=[]
    for i in range (2):
        joueur = input("Entrez le nom du joueur " + str(i + 1) + " ")
        joueurs.append(joueur)
    return joueurs

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

def tour(joueurs, joueur_actif, plateau, k):
    coup = entree_coup(joueurs, joueur_actif, plateau, k)
    jouer_coup(coup, plateau)
    affiche_plateau(plateau)
    fin = victoire(plateau)
    return fin
==

text==


Ecrire une fonction **jeu_de_nim** qui vérifie le doctest suivant :

    la fonction jeu_de_nim(n, k) implémente le jeu de nim pour n alumettes
    initiales dans lequel on ne peut jamais tirer plus de k alumettes 
    à chaque tour. Cette fonction réalise les étapes suivantes:
     1. Demande le nom des joueurs,
     2. Initialise le plateau,
     3. Affiche le plateau,
     4. Réalise les tours de jeu jusqu'à la fin de la partie
     5. Affiche "nom du gagnant vous avez gagné !"
    Cette fonction retourne le nom du gagnant.

    Considérez que toutes les fonctions précédemment demandées sont faites et 
    fonctionnent correctement.

    exemple:
    >>> gagnant = jeu_de_nim(21, 3)
    Entrez le nom du joueur 1 Bob
    Entrez le nom du joueur 2 Alice
    | | | | | | | | | | | | | | | | | | | | |
    Bob combien voulez vous en enlever ? 3
    | | | | | | | | | | | | | | | | | |
    Alice combien voulez vous en enlever ? 4
    Impossible.
    Alice combien voulez vous en enlever ? 3
    | | | | | | | | | | | | | | |
    Bob combien voulez vous en enlever ? 3
    | | | | | | | | | | | |
    Alice combien voulez vous en enlever ? 3
    | | | | | | | | |
    Bob combien voulez vous en enlever ? 3
    | | | | | |
    Alice combien voulez vous en enlever ? 3
    | | |
    Bob combien voulez vous en enlever ? 2
    |
    Alice combien voulez vous en enlever ? 0
    Impossible.
    Alice combien voulez vous en enlever ? 1

    Bob vous avez gagné !
    >>> gagnant
    'Bob'


==



pltest==
>>> from unittest.mock import patch #
>>> with patch('builtins.input', side_effect=['Bob', 'Alice','3','4','3','3','3','3','3','2','0','1']):
...    gagnant = jeu_de_nim(21, 3) #
>>> gagnant
'Bob'
==









