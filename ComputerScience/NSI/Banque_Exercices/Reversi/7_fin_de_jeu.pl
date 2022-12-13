
@ /builder/before.py [builder.py]
extends = func.pl

funcname= fin_de_jeu
title=Fin de jeu

pltest==
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
True
==

before== #|python| 

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






