
@ /builder/before.py [builder.py]
extends = func.pl
@ /ComputerScience/NSI/Banque_Exercices/Reversi/pltestgrader_before.py [grader.py]

funcname= fin_de_jeu
title=Fin de jeu

pltest==
>>> jeu = {
...    "plateau": [
...        [None, None, None, None],
...        [None,  'joueur1',  'joueur2', None],
...        [None,  'joueur2',  'joueur1', None],
...        [None, None, None, None]
...        ],
...    "joueur actif": "joueur1",
...    "joueur1":  {
...            "nom": "joueur1",
...            "couleur": "white",
...            "score": 2 
...        },
...    "joueur2":  {
...            "nom": "joueur2",
...            "couleur": "red",
...            "score": 2 
...        },
...    "parametres":{
...        'framerate': 10,
...        'plateau' : 4,
...        'taille_fenetre' : 640
...        }
...    } #
>>> fin_de_jeu(jeu) # Tout va bien, la partie peut continuer :
False
>>> jeu = {
...    "plateau": [
...        [None, None, None, None],
...        [None,  'joueur2',  'joueur2', None],
...        [None,  'joueur2',  'joueur2', None],
...        [None, None, None, None]
...        ],
...    "joueur actif": "joueur1",
...    "joueur1":  {
...            "nom": "joueur1",
...            "couleur": "white",
...            "score": 2 
...        },
...    "joueur2":  {
...            "nom": "joueur2",
...            "couleur": "red",
...            "score": 2 
...        },
...    "parametres":{
...        'framerate': 10,
...        'plateau' : 4,
...        'taille_fenetre' : 640
...        }
...    } #
>>> fin_de_jeu(jeu)  # Le joueur actif ne peut plus jouer :
True
>>> jeu = {
...    "plateau": [
...        [None, None, None, None],
...        [None,  'joueur2',  'joueur2', None],
...        [None,  'joueur2',  'joueur1', None],
...        [None, None, None, None]
...        ],
...    "joueur actif": "joueur1",
...    "joueur1":  {
...            "nom": "joueur1",
...            "couleur": "white",
...            "score": 14 
...        },
...    "joueur2":  {
...            "nom": "joueur2",
...            "couleur": "red",
...            "score": 2 
...        },
...    "parametres":{
...        'framerate': 10,
...        'plateau' : 4,
...        'taille_fenetre' : 640
...        }
...    } #
>>> fin_de_jeu(jeu)  # Plus de place sur le plateau :
True
==

before== #|python| 
def fin_de_jeu(jeu):
    if jeu['joueur1']['score'] + jeu['joueur2']['score'] == jeu['parametres']['plateau'] ** 2:
        return True
    if len(coups_possibles(jeu)) == 0:
        return True
    return False
==

befor==
def autre_joueur(joueur):
    if joueur == "joueur1":
        return "joueur2"
    elif joueur == "joueur2":
        return "joueur1"

def case_appartient_plateau(jeu, case):
    plateau = jeu['plateau']
    i, j = case
    if -1 < i < len(plateau) and -1 < j < len(plateau):
        return True
    else:
        return False

def coup_possible_direction(jeu, coup, dir):
    plateau = jeu['plateau']
    joueur_actif = jeu['joueur actif']
    autrejoueur = autre_joueur(joueur_actif)
    i, j = coup
    dx, dy = dir
    x, y = i + dx, j + dy
    lstdir = []
    while case_appartient_plateau(jeu, (x, y)) and plateau[x][y] == autrejoueur:
        lstdir.append((x, y))
        x, y = x + dx, y + dy
    if case_appartient_plateau(jeu, (x, y)) and plateau[x][y] == joueur_actif:
        return lstdir
    else:
        return []

def coup_possible(jeu, coup):
    lst = []
    directions = [(-1, -1),(-1, 0),(-1, 1),(0, -1),(0, 1),(1, -1),(1, 0),(1, 1)]
    for dir in directions:
        lst.extend(coup_possible_direction(jeu, coup, dir))
    return lst


def coups_possibles(jeu):
    plateau = jeu['plateau']
    dico = {}
    for i in range(len(plateau)):
        for j in range(len(plateau)):
            possible = coup_possible(jeu, (i, j))
            if len(possible) != 0:
                dico[(i,j)] = possible
    return dico
==

doctest==
    la fonction fin_de_jeu(jeu) renvoie True si le joueur actif n'a aucun coup possible ou si 
    il n'y a plus de place sur le plateau (si la somme des scores est égale au nombre de case
    sur le plateau). Renvoie False dans le cas contraire.
    Cette fonction utilise donc la fonction coups_possible.

    exemple:
    >>> jeu = {
        "plateau": [
            [None, None, None, None],
            [None,  'joueur1',  'joueur2', None],
            [None,  'joueur2',  'joueur1', None],
            [None, None, None, None]
            ],
        "joueur actif": "joueur1",
        "joueur1":  {
                "nom": "joueur1",
                "couleur": "white",
                "score": 2 
            },
        "joueur2":  {
                "nom": "joueur2",
                "couleur": "red",
                "score": 2 
            },
        "parametres":{
            'framerate': 10,
            'plateau' : 4,
            'taille_fenetre' : 640
            }
        }
    >>> fin_de_jeu(jeu)
    False
    >>> jeu = {
        "plateau": [
            [None, None, None, None],
            [None,  'joueur2',  'joueur2', None],
            [None,  'joueur2',  'joueur2', None],
            [None, None, None, None]
            ],
        "joueur actif": "joueur1",
        "joueur1":  {
                "nom": "joueur1",
                "couleur": "white",
                "score": 2 
            },
        "joueur2":  {
                "nom": "joueur2",
                "couleur": "red",
                "score": 2 
            },
        "parametres":{
            'framerate': 10,
            'plateau' : 4,
            'taille_fenetre' : 640
            }
        }
    >>> fin_de_jeu(jeu)
    True # Car le joueur 1 ne peut plus jouer
    
==






