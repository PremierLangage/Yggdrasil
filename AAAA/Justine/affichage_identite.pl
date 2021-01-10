


# Author: Justine Falque

extends=/ComputerScience/python/template/soluce.pl
 

@ /builder/before.py [builder.py]

#author=Justine Falque
title=Affichage

text==

Ecrire une ligne de code qui affiche le contenu d'un dictionnaire ``hero`` (supposé déjà déclaré et initialisé) dont les clés 
sont ``'nom'``, ``'prenom'`` et ``'pseudo'`` et qui affiche ``Prénom Nom se fait appeler pseudo.``
(ne pas oublier pas le point).

Par exemple, si ``hero`` contient ``{'prenom': 'Bruce', 'nom': 'Wayne', 'pseudo': 'Batman'}``, l'affichage doit être :

``Bruce Wayne se fait appeler Batman.``
==

tag=dictionary|print

soluce==
print(hero['prenom'], hero['nom'], "se fait appeler", hero['pseudo'])
==

before==
hero1 = {'prenom': 'Bruce', 'nom': 'Wayne', 'pseudo': 'Batman'}
hero2 = {'prenom': 'Peter', 'nom': 'Parker', 'pseudo': 'Spiderman'}
hero3 = {'prenom': 'Selina', 'nom': 'Kyle', 'pseudo': 'Catwoman'}
hero = hero3
==



