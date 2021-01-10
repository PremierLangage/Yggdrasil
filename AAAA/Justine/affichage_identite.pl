


# Author: Justine Falque

extends=/ComputerScience/python/AP1-1920/templates/prosoluce.pl

#author=Justine Falque
title=Affichage

text==

Ecrire une fonction ``superhero(hero)`` qui prend en paramètre un dictionnaire ``hero`` dont les clés 
sont ``'nom'``, ``'prenom'`` et ``'pseudo'`` et qui affiche ``Prénom Nom se fait appeler pseudo.``
(ne pas oublier pas le point).

Par exemple :

``>>> hero1 = {'prenom': 'Bruce', 'nom': 'Wayne', 'pseudo': 'Batman'}``

``>>> superhero(hero1)``

``Bruce Wayne se fait appeler Batman.``
==

tag=dictionary|print

soluce==
def superhero(hero):
    print(hero['prenom'], hero['nom'], "se fait appeler", hero['pseudo'])
==

before==
==

cache==
hero1 = {'prenom': 'Bruce', 'nom': 'Wayne', 'pseudo': 'Batman'}
hero2 = {'prenom': 'Peter', 'nom': 'Parker', 'pseudo': 'Spiderman'}
hero3 = {'prenom': 'Selina', 'nom': 'Kyle', 'pseudo': 'Catwoman'}
==

after==
superhero(hero3)
==

mplsoluce==
templates==

