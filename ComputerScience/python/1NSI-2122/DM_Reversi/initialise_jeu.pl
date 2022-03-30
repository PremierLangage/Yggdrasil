
@ /builder/before.py [builder.py]
extends = func.pl

funcname= initialise_jeu
title= Initialise le jeu

before==
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
==

doctest==
    la fonction initialise_jeu(taille) initialise le dictionnaire jeu tel que défini dans la page d'accueil.
    Deux joueurs appelés "joueur1" et "joueur2".
    Un plateau de taille par taille. On fera l'hypothèse que taille est pair.

    exemple:
    >>> initialise_jeu(4)
    {"plateau": [
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
    
==

pltest==
>>> initialise_jeu(4)
{'plateau': [[-1, -1, -1, -1], [-1, 0, 1, -1], [-1, 1, 0, -1], [-1, -1, -1, -1]], 'joueur actif': 0, 'joueurs': [{'nom': 'joueur1', 'couleur': 'white', 'score': 2}, {'nom': 'joueur2', 'couleur': 'red', 'score': 2}], 'parametres': {'framerate': 10, 'plateau': 4, 'taille_fenetre': 640}}
==



