
extends = func.pl

title= Choix de la carte a jouer pour le premier joueur

texte==

Le choix d'entame est le moment le plus délicat pour le joueur, nous proposont un stratégie simple le joueur joue sa carte la plus forte.

Ce n'est pas la meilleur statégie (pensez au dix de der les points du dernier plis).

Mais c'est une stratégie facile a programmer :) et nous pourrons l'améliorée une fois que le reste du programme tourne ...

Une stratégie un peu meilleur cherche à joueur une carte qui est sure de faire le plis en fonction des cartes déjà jouées (par exemple).

{{doctest}}

==
doctest==
la fonction choixentame(jeudujoeur, atout, pliss) prend un parametre une liste cartes l'atout et les plis déjà réalisés.

la fonction retire du jeux du joueur et la retourne la carte la plus forte (strength).
==

pltest==
>>> choixentame([("9","carreau"),("8","carreau")],"pique", None)
("9", "carreau")
>>> choixentame([("Valet","Coeur"),("Valet","Pique")],"pique", None)
("Valet", "Coeur")
==
