@ /builder/before.py [builder.py]
extends = func.pl

funcname= coup_possible
title= Ce coup est-il possible ?

pltest==
>>> jeu = {
... "plateau": [
...     [-1, -1, -1, -1],
...     [-1,  0,  1, -1],
...     [-1,  1,  0, -1],
...     [-1, -1, -1, -1]
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
>>> coup_possible(jeu, (1,3))
[(1, 2)]
>>> coup_possible(jeu, (0,1))
[]
>>> jeu = {
... "plateau": [
...     [-1, -1, -1, -1],
...     [-1,  0,  0, -1],
...     [1 ,  0,  0, -1],
...     [1 , -1,  1, -1]
...     ],
... "joueur actif": "joueur2",
... "joueur1":  {
...         "nom": "joueur1",
...         "couleur": "white",
...         "score": 2 
...     },
... "joueur2":  {
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
>>> coup_possible(jeu, (0,2))
[(1, 1),(1, 2),(2, 2)]
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
                if -1 < i + k * dir[0] < len(plateau) and -1 < j + k * dir[1] < len(plateau) and k != 1 and plateau[i + k * dir[0]][j + k * dir[1]] ==joueur_actif:
                    if (i,j) in dico:
                        dico[(i,j)].append(dir)
                    else:
                        dico[(i,j)] = [dir]
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


doctest==
    la fonction coup_possible(jeu, coup) retourne les coordonnées des
    pions à retourner si le coup est possible pour le joueur actif.
    Si la fonction renvoie la liste [(1, 1),(1, 2),(2, 2)] cela signifie
    que le coup est possible et qu'il permettra de retourner 3 pions aux
    coordonnées indiquées.

    exemple:
    >>> jeu = {
        "plateau": [
            [-1, -1, -1, -1],
            [-1,  0,  0, -1],
            [1 ,  0,  0, -1],
            [1 , -1,  1, -1]
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
    >>> coup_possible(jeu, (0, 2))
    [(1, 1),(1, 2),(2, 2)]
==






