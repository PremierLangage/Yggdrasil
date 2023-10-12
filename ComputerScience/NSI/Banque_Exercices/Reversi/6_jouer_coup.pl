@ /builder/before.py [builder.py]
extends = func.pl
@ /ComputerScience/NSI/Banque_Exercices/Reversi/pltestgrader_before.py [grader.py] # grader permettant d'ajouter des fonctions disponibles pour les eleves dans befor

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
    return "\n".join(lst)

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

def jouer_coup(jeu, coup, dico_coups_possibles):
    plateau = jeu['plateau']
    joueur_actif = jeu['joueur actif']
    autrejoueur = autre_joueur(joueur_actif)
    score_coup = 0
    i, j = coup
    plateau[i][j] = joueur_actif
    for case in dico_coups_possibles[coup]:
        i, j = case
        plateau[i][j] = joueur_actif
        score_coup += 1
    jeu[joueur_actif]['score'] += score_coup + 1
    jeu[autrejoueur]['score'] -= score_coup
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
>>> affiche(jeu['plateau'])
{}
>>> jeu['joueur actif']
'{}'
>>> jeu['joueur1']['score']
{}
>>> coups = {} #
>>> jouer_coup(jeu, {}, coups) #
>>> affiche(jeu['plateau'])
{}
>>> jeu['joueur actif']
'{}'
>>> jeu['joueur1']['score']
{}
""".format(jeu_init, coups1, coup1, affiche(jeu1['plateau']), jeu1['joueur actif'], jeu1['joueur1']['score'], coups2, coup2, affiche(jeu['plateau']), jeu['joueur actif'], jeu['joueur1']['score'])
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
    >>> jouer_coup(jeu, (0,2), coups_possibles)
    >>> jeu['plateau']
    [[None, None, None, None],
    [None,  'joueur1',  'joueur2', None],
    [ 'joueur1',  'joueur1',  'joueur1', None],
    [None, None, None, None]]
    >>> jeu['joueur actif']
    1
    >>> jeu['joueur1']['score']
    4
    >>> jeu['joueur2']['score']
    1
==





