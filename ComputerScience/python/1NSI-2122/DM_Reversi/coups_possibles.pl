@ /builder/before.py [builder.py]
extends = func.pl

funcname= coups_possibles
title= Quels sont les coups possibles ?

pltest==
>>> jeu = {
... "plateau": [
...     [-1, -1, -1, -1],
...     [-1,  0,  1, -1],
...     [-1,  1,  0, -1],
...     [-1, -1, -1, -1]
...     ],
... "joueur actif": 0,
... "joueurs":  [{
...         "nom": "joueur1",
...         "couleur": "white",
...         "score": 2 
...     },
...     {
...         "nom": "joueur2",
...         "couleur": "red",
...         "score": 2 
...     }],
... "parametres":{
...     'framerate': 10,
...     'plateau' : 4,
...     'taille_fenetre' : 640
...     }
... } # 
>>> coups_possibles(jeu)
[(0, 2), (1, 3), (2, 0), (3, 1)]
>>> jeu = {
... "plateau": [
...     [-1, -1, -1, -1],
...     [-1,  0,  0, -1],
...     [-1,  1,  0, -1],
...     [-1, -1, -1, -1]
...     ],
... "joueur actif": 0,
... "joueurs":  [{
...         "nom": "joueur1",
...         "couleur": "white",
...         "score": 2 
...     },
...     {
...         "nom": "joueur2",
...         "couleur": "red",
...         "score": 2 
...     }],
... "parametres":{
...     'framerate': 10,
...     'plateau' : 4,
...     'taille_fenetre' : 640
...     }
... } # 
>>> coups_possibles(jeu)
[(2, 0), (3, 1)]
==


before== #|python| 
from random import randint

def initialise_jeu(taille):
    assert taille % 2 == 0
    jeu = {
        "plateau": [],
        "joueur actif": 0,
        "joueurs":  [{
                "nom": "joueur1",
                "couleur": "white",
                "score": 2 
            },
            {
                "nom": "joueur2",
                "couleur": "red",
                "score": 2 
            }],
        "parametres":{
            'framerate': 10,
            'plateau' : taille,
            'taille_fenetre' : 640
            }
        }
    for i in range(taille):
        jeu['plateau'].append([-1] * taille)
    jeu['plateau'][taille // 2 - 1][taille // 2 - 1] = 0
    jeu['plateau'][taille // 2 ][taille // 2 ] = 0
    jeu['plateau'][taille // 2 ][taille // 2 - 1] = 1
    jeu['plateau'][taille // 2 - 1][taille // 2 ] = 1
    return jeu

def coups_possibles(jeu):
    plateau = jeu['plateau']
    joueur_actif = jeu['joueur actif']
    dico = {}
    autrejoueur = 1 - joueur_actif
    directions = [(-1, -1),(-1, 0),(-1, 1),(0, -1),(0, 1),(1, -1),(1, 0),(1, 1)]
    for i in range(len(plateau)):
        for j in range(len(plateau)):
            if plateau[i][j] != -1:
                continue
            for dir in directions:
                k = 1
                while -1 < i + k * dir[0] < len(plateau) and -1 < j + k * dir[1] < len(plateau) and plateau[i + k * dir[0]][j + k * dir[1]] == autrejoueur:
                    k += 1
                if k != 1 and plateau[i + k * dir[0]][j + k * dir[1]] ==joueur_actif:
                    if (i,j) in dico:
                        dico[(i,j)].append(dir)
                    else:
                        dico[(i,j)] = [dir]
    return dico

taille = randint(3,8) * 2
jeu = initialise_jeu(taille)
coups = coups_possibles(jeu)

pltest += """
>>> coups_possibles({})
{}
""".format(jeu, coups)
==


doctest==
    la fonction coups_possibles(jeu) retourne la liste des coups possibles.
    Il s'agit donc d'une liste de tuples

    exemple:
    >>> jeu = {
        "plateau": [
            [-1, -1, -1, -1],
            [-1,  0,  1, -1],
            [-1,  1,  0, -1],
            [-1, -1, -1, -1]
            ],
        "joueur actif": 0,
        "joueurs":  [{
                "nom": "joueur1",
                "couleur": "white",
                "score": 2 
            },
            {
                "nom": "joueur2",
                "couleur": "red",
                "score": 2 
            }],
        "parametres":{
            'framerate': 10,
            'plateau' : 4,
            'taille_fenetre' : 640
            }
        }
    >>> coups_possibles(jeu)
    [(0,2),(1,3),(2,0),(3,1)]
    
==





