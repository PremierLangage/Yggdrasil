@ /builder/before.py [builder.py]
extends = func.pl

funcname= jouer_coup
title= Jouer un coup

pltest==

==


before== #|python| 
from random import randint, choice
import copy

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

def jouer_coup(jeu, case, dico_coups_possibles):
    plateau = jeu['plateau']
    joueur_actif = jeu['joueur actif']
    i, j = case
    autrejoueur = 1 - joueur_actif
    for dir in dico_coups_possibles[case]:
        k = 1
        while -1 < i + k * dir[0] < len(plateau) and -1 < j + k * dir[1] < len(plateau) and plateau[i + k * dir[0]][j + k * dir[1]] == autrejoueur:
            plateau[i + k * dir[0]][ j + k * dir[1]] = joueur_actif
            jeu['joueurs'][autrejoueur]['score'] -= 1
            jeu['joueurs'][joueur_actif]['score'] += 1
            k += 1
    plateau[i][j] = joueur_actif
    jeu['joueurs'][joueur_actif]['score'] += 1
    jeu['joueur'] = autrejoueur
    jeu['joueur actif'] = autrejoueur

taille = randint(3,8) * 2
jeu = initialise_jeu(taille)
jeu_init = copy.deepcopy(jeu)
coups1 = coups_possibles(jeu)
coup1 = choice(list(coups1.keys()))
jouer_coup(jeu, coup1, coups1)
jeu1 = copy.deepcopy(jeu)
coups2 = coups_possibles(jeu)
coup2 = choice(list(coups2.keys()))
jouer_coup(jeu, coup2, coups2)


pltest += """
>>> jeu = {} #
>>> coups = {} #
>>> jouer_coup(jeu, {}, coups) #
>>> jeu['plateau']
{}
>>> jeu['joueur actif']
{}
>>> jeu['joueurs'][0]['score']
{}
>>> coups = {} #
>>> jouer_coup(jeu, {}, coups) #
>>> jeu['plateau']
{}
>>> jeu['joueur actif']
{}
>>> jeu['joueurs'][0]['score']
{}
""".format(jeu_init, coups1, coup1, jeu1['plateau'], jeu1['joueur actif'], jeu1['joueurs'][0]['score'], coups2, coup2, jeu['plateau'], jeu['joueur actif'], jeu['joueurs'][0]['score'])
==


doctest==
    la fonction jouer_coup(jeu, case, dico_coups_possibles) joue 
    le coup dans la case donnée.

    La case est un couple (tuple). 

    dico_coups_possibles est le dictionnaire renvoyée par la fonction
    précédente, il permet de savoir dans quelle direction on va retourner
    les pions.

    Il modifie donc le plateau du jeu, le joueur actif et les scores.

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
    >>> jouer_coup(jeu, (0,2), coups_possibles)
    >>> jeu['plateau']
    [[-1, -1, -1, -1],
    [-1,  0,  1, -1],
    [ 0,  0,  0, -1],
    [-1, -1, -1, -1]]
    >>> jeu['joueur actif']
    1
    >>> jeu['joueurs'][0]['score']
    4
    >>> jeu['joueurs'][1]['score']
    1
==





