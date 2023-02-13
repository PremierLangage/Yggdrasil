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
{(0, 2): [(1, 0)], (1, 3): [(0, -1)], (2, 0): [(0, 1)], (3, 1): [(-1, 0)]}
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
{(0, 2): [(1, 0)], (1, 3): [(0, -1)]}
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
    la fonction coups_possibles(jeu) retourne les coups possibles 
    dans un dictionnaire.
    Chaque clé est le couple (tuple) correspondant au coup possible 
    et la valeur est la direction dans laquelle le coup est possible 
    (sous forme de couple).
    Si la fonction renvoie le dictionnaire {(4,2):[(-1,0),(-1,1)]}
     cela signifie qu'il n'y a qu'un coup possible aux coordonnées (4,2) 
     mais qu'il retournera des pions dans deux directions: (-1,0) c'est
    à dire vers la gauche et (-1,1) c'est à dire en bas à gauche (attention
     les abscisses vont vers la droite et les ordonnées vers le bas).

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
    {(0, 2): [(1, 0)], (1, 3): [(0, -1)], (2, 0): [(0, 1)], (3, 1): [(-1, 0)]}
    
==





