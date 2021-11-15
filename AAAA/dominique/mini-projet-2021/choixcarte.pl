




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
la fonction **choixecarte(plis,jeudujoeur, atout, pliss)** prend un parametre les cartes actuelles du plis,
 la liste cartes de joueur,  l'atout et les pliss déjà réalisés.

ATTENTION la fonction respecte les règles:  
- fournir à la couleur  
- couper (sauf si le partenaire est maitre)
- monter à l'atout.

Dans le cas ou l'on défausse (pas de couleur , pas d'atout ou partenaire maitre), et que le partenaire est maitre 
on vas jouer la carte avec la plus grande valeur sinon de plus petite.

la fonction retire du jeux du joueur et la retourne la carte la plus forte (strength).
==

pltest==
>>> choixecarte([("7","Carreau")],[("9","Carreau"),("8","Carreau")],"pique", None)
('9', 'Carreau')
>>> choixecarte([("8","Pique")],[("10","Carreau"),("As","Carreau"),("7","Pique"),("As","Pique")],"Pique", None) # monter à l'atout
('As', 'Pique')
>>> choixecarte([("8","Pique"),("Dame","Pique")],[("10","Carreau"),("As","Carreau"),("7","Pique"),("As","Pique")],"Pique", None) # monter à l'atout
('As', 'Pique')
>>> choixecarte([("8","Pique"),("Dame","Pique"),("As","Pique")],[("10","Carreau"),("As","Carreau"),("7","Pique"),("9","Pique")],"Pique", None) # monter à l'atout
('9', 'Pique')
>>> choixecarte([("8","Pique"),("As","Pique"),("Dame","Pique")],[("10","Carreau"),("As","Carreau"),("7","Pique"),("9","Pique")],"Pique", None) # défausse sur partenaire 
('As', 'Carreau')
==
