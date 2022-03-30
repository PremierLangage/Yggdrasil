extends = func.pl

funcname= coups_possibles
title= Quels sont les coups possibles ?

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

pltest1==
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
==




