




extends = func.pl

title= Choix de la carte a jouer pour les trois joueurs suivants

text==

Le choix de la carte a jouer après la carte initiale, doit respecter les règles du jeux de la carte.
Ce n'est pas la meilleur statégie (pensez au dix de der les points du dernier plis).

Mais c'est une stratégie facile a programmer :) et nous pourrons l'améliorée une fois que le reste du programme tourne ...

Une stratégie un peu meilleur cherche à joueur une carte qui est sure de faire le plis en fonction des cartes déjà jouées (par exemple).

{{doctest}}

==
doctest==
la fonction **choixentame(jeudujoeur, atout, pliss)** prend un parametre une liste cartes l'atout et les plis déjà réalisés.

la fonction retire du jeux du joueur et la retourne la carte la plus forte (strength).
==

pltest==
>>> choixentame([("9","carreau"),("8","carreau")],"pique", None)
('9', 'carreau')
>>> choixentame([("Valet","Coeur"),("Valet","Pique")],"pique", None)
('Valet', 'Coeur')
>>> choixentame([("Valet","Coeur"),("9","Pique"),("10","Coeur")],"pique", None)
('9', 'Pique')
==
