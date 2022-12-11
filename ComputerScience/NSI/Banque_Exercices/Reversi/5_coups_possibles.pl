@ /builder/before.py [builder.py]
extends = func.pl
@ /ComputerScience/NSI/Banque_Exercices/Reversi/pltestgrader_before.py [grader.py]

funcname= coups_possibles
title= Quels sont tous les coups possibles ?

pltest==
>>> jeu = {
... "plateau": [
...     [None, None, None, None],
...     [None,  "joueur1",  "joueur2", None],
...     [None,  "joueur2",  "joueur1", None],
...     [None, None, None, None]
...     ],
... "joueur actif": "joueur1",
... "joueur1": {
...         "nom": "joueur1",
...         "couleur": "white",
...         "score": 2 
...     },
... "joueur2":
...     {
...         "nom": "joueur2",
...         "couleur": "red",
...         "score": 2 
...     },
... "parametres":{
...     'framerate': 10,
...     'plateau' : 4,
...     'taille_fenetre' : 640
...     }
... } #
>>> affiche(jeu["plateau"])
|   |   |   |   |
|   | 1 | 2 |   |
|   | 2 | 1 |   |
|   |   |   |   |
>>> coups_possibles(jeu)
{(0, 2): [(1, 2)], (1, 3): [(1, 2)], (2, 0): [(2, 1)], (3, 1): [(2, 1)]}
>>> jeu = {
... "plateau": [
...     [None, None, None, None],
...     [None,  "joueur1",  "joueur1", None],
...     [None,  "joueur2",  "joueur1", None],
...     [None, None, None, None]
...     ],
... "joueur actif": "joueur1",
... "joueur1":  {
...         "nom": "joueur1",
...         "couleur": "white",
...         "score": 2 
...     },
... "joueur2":{
...         "nom": "joueur2",
...         "couleur": "red",
...         "score": 2 
...     },
... "parametres":{
...     'framerate': 10,
...     'plateau' : 4,
...     'taille_fenetre' : 640
...     }
... } #
>>> affiche(jeu["plateau"])
|   |   |   |   |
|   | 1 | 1 |   |
|   | 2 | 1 |   |
|   |   |   |   |
>>> coups_possibles(jeu)
{(2, 0): [(2, 1)], (3, 0): [(2, 1)], (3, 1): [(2, 1)]}
==


before== #|python| 
from random import randint

def initialise_jeu(taille):
    assert taille % 2 == 0
    jeu = {
        "plateau": [],
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
            'plateau' : taille,
            'taille_fenetre' : 640
            }
        }
    for i in range(taille):
        jeu['plateau'].append([None] * taille)
    jeu['plateau'][taille // 2 - 1][taille // 2 - 1] = "joueur1"
    jeu['plateau'][taille // 2 ][taille // 2 ] = "joueur1"
    jeu['plateau'][taille // 2 ][taille // 2 - 1] = "joueur2"
    jeu['plateau'][taille // 2 - 1][taille // 2 ] = "joueur2"
    return jeu

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

taille = randint(3,8) * 2
jeu = initialise_jeu(taille)
coups = coups_possibles(jeu)

pltest += """
>>> jeu = {} #
>>> coups_possibles(jeu)
{}
""".format(jeu, coups)
==

befor ==
def affiche(plateau):
    lst = []
    for ligne in plateau:
        lstligne = []
        for cell in ligne:
            if cell == None:
                lstligne.append(" ")
            elif cell =="joueur1":
                lstligne.append("1")
            else:
                lstligne.append("2")
        lst.append("| " + " | ".join(lstligne) + " |")
    print("\n".join(lst))


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
==

doctest==
    la fonction coups_possibles(jeu) retourne les coups possibles 
    dans un dictionnaire.
    Chaque clé est le couple (tuple) correspondant au coup possible 
    et la valeur est la direction dans laquelle le coup est possible 
    (sous forme de couple).
    Si la fonction renvoie le dictionnaire {(4,2):[(-1,0),(-1,1)]}
     cela signifie qu'il n'y a qu'un coup possible aux coordonnées (4,2) 
     mais qu'il retournera des pions dans deux directions: (-1,0) c'est
    à dire vers le haut et (-1,1) c'est à dire en haut à droite (attention
     les abscisses vont vers la droite et les ordonnées vers le bas).

    exemple:
    >>> jeu = {
        "plateau": [
            [None, None, None, None],
            [None,  "joueur1",  "joueur2", None],
            [None,  "joueur2",  "joueur1", None],
            [None, None, None, None]
            ],
        "joueur actif": "joueur1",
        "joueur1": {
                "nom": "joueur1",
                "couleur": "white",
                "score": 2 
            },
        "joueur2":
            {
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
    >>> coups_possibles(jeu)
    {(0, 2): [(1, 0)], (1, 3): [(0, -1)], (2, 0): [(0, 1)], (3, 1): [(-1, 0)]}
    
==





