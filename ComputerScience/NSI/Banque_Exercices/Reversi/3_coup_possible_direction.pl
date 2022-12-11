@ /builder/before.py [builder.py]
extends = func.pl
@ /ComputerScience/NSI/Banque_Exercices/Reversi/pltestgrader_before.py [grader.py]

funcname= coup_possible_direction
title= Ce coup retournera-t-il des pions dans cette direction ?

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
>>> coup_possible_direction(jeu, (1, 3), (0, -1))
[(1, 2)]
>>> coup_possible_direction(jeu, (1, 3), (-1, 0))
[]
>>> coup_possible_direction(jeu, (0, 1), (0, 1))
[]
>>> jeu = {
... "plateau": [
...     [None, None, None, None],
...     [None,  "joueur1",  "joueur1", None],
...     ["joueur2" ,  "joueur1",  "joueur1", None],
...     ["joueur2" , None,  "joueur2", None]
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
>>> coup_possible_direction(jeu, (0, 2), (1, 0))
[(1, 2), (2, 2)]
==

befor ==
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

taille = randint(3, 8) * 2
jeu = initialise_jeu(taille)
coup = coup_possible_direction(jeu, (0, 0), (1, 0))

pltest += """
>>> jeu = {} #
>>> coup_possible_direction(jeu, (0, 0), (1, 0))
{}
""".format(jeu, coup)
==


doctest==
    la fonction coup_possible_direction(jeu, coup, dir) retourne une liste des coordonnées des
    pions à retourner si le coup est possible dans la direction dir pour le joueur actif.
    coup est donc un tuple de l'endroit ou on tente de jouer. (1, 2) signifie que l'on tente
    de jouer à la ligne 1 (on compte à partir de 0) et à la colonne 2.
    dir est un tuple de la direction dans laquelle on veut savoir si on va retourner des 
    pions adverses. 
     * (-1, 0) signifie que l'on veut savoir si on va retourner des pions 
    vers le haut:  -1 pour dire une ligne en moins, 0 signifie même colonne.
     * (1, 1) signifie que l'on veut savoir si on va retourner des pions 
    vers le bas à droite (diagonale):  1 pour dire une ligne en plus, 1 signifie 
    une colonne en plus.
    Si la fonction renvoie la liste [(1, 2),(2, 2)] cela signifie
    que le coup dans cette direction permettra de retourner 2 pions aux
    coordonnées indiquées.

    exemple:
    >>> jeu = {
        "plateau": [
            [None, None, None, None],
            [None,  "joueur1",  "joueur1", None],
            ["joueur2" ,  "joueur1",  "joueur1", None],
            ["joueur2" , None,  "joueur2", None]
            ],
        "joueur actif": "joueur2",
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
    >>> coup_possible(jeu, (0, 2), (1, 0))
    [(1, 2),(2, 2)] # Le joueur2 peut joueur en (0, 2). Il retournera 2 pions vers le bas.
    >>> coup_possible(jeu, (3, 1), (0, 1))
    [] # Le joueur2 ne retournera aucun pion vers la droite si il joueu en (3, 1).
==







