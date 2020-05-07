# Test d'une classe Graphe implémentant un graphe orienté non pondéré.
@ /utils/sandboxio.py
@ corrlib_graphes.py
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Graphe orienté non pondéré
text==
Écrivez une classe <strong>GrapheOriente</strong> implémentant l'interface d'un graphe orienté non pondéré décrite au cours.
==



# Les tests:

## Vérifications basiques de la classe Graphe
#testname0 = Vérifications basiques de la classe Graphe
## Tests d'indices non consécutifs pour les sommets => exclusion des listes et matrices d'adjacence
#pltest0== 
#>>> G = GrapheOriente()  # Existence d'une classe GrapheOriente
#>>> G.ajouter_arcs([(0, 2), (1, 0), (1, 2), (2, 3), (3, 1)])  # Ajout d'arcs
#>>> sorted(G.sommets()) # Vérification de l'ensemble des sommets
#[0, 1, 2, 3]
#>>> sorted(map(list, G.arcs())) # Vérification de l'ensemble des arcs
#[[0, 2], [1, 0], [1, 2], [2, 3], [3, 1]]
#>>> sorted((v, sorted(G.successeurs(v))) for v in G.sommets()) # Vérification des successeurs
#[(0, [2]), (1, [0, 2]), (2, [3]), (3, [1])]
#>>> sorted((v, sorted(G.predecesseurs(v))) for v in G.sommets()) # Vérification des prédécesseurs
#[(0, [1]), (1, [3]), (2, [0, 1]), (3, [2])]
#>>> sorted((v, G.degre_entrant(v)) for v in G.sommets())  # Degrés entrants
#[(0, 1), (1, 1), (2, 2), (3, 1)]
#>>> sorted((v, G.degre_sortant(v)) for v in G.sommets())  # Degrés sortants
#[(0, 1), (1, 2), (2, 1), (3, 1)]
#==

testname0 = Vérifications de la classe GrapheOriente
# Tests d'indices non consécutifs pour les sommets => exclusion des listes et matrices d'adjacence
pltest0== 
>>> from corrlib_graphes import CFC_INSTANCE_TD #
>>> G = GrapheOriente(); G.ajouter_arcs(CFC_INSTANCE_TD) # initialisation de l'instance du TD
>>> sorted(G.sommets()) # Vérification de l'ensemble des sommets
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
>>> sorted(map(list, G.arcs())) # Vérification de l'ensemble des arcs
[[1, 2], [1, 3], [2, 1], [3, 1], [3, 5], [4, 1], [4, 2], [4, 11], [4, 12], [5, 6], [6, 7], [6, 9], [7, 9], [8, 5], [8, 10], [9, 8], [9, 10], [9, 13], [10, 11], [10, 13], [11, 12], [12, 10], [12, 14], [13, 12], [14, 13]]
>>> G.contient_arc(12,10)
True
>>> G.contient_arc(10,12)
False
>>> G.contient_arc(10,42)
False
>>> G.contient_arc(100,42)
False
>>> G.contient_sommet(9)
True
>>> G.contient_sommet(4)
True
>>> G.contient_sommet(0)
False
>>> G.contient_sommet(42)
False
>>> G.retirer_sommet(6); sorted(G.sommets()) # Vérification de l'ensemble des sommets après suppression de 6
[1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14]
>>> sorted(map(list, G.arcs())) # Vérification de l'ensemble des arcs
[[1, 2], [1, 3], [2, 1], [3, 1], [3, 5], [4, 1], [4, 2], [4, 11], [4, 12], [7, 9], [8, 5], [8, 10], [9, 8], [9, 10], [9, 13], [10, 11], [10, 13], [11, 12], [12, 10], [12, 14], [13, 12], [14, 13]]
>>> G.nombre_sommets()
13
>>> G.nombre_arcs()
22
>>> G.retirer_sommets([12,10]); sorted((v, sorted(G.predecesseurs(v))) for v in G.sommets()) # suppression de 10 et 12 et vérification des prédécesseurs
[(1, [2, 3, 4]), (2, [1, 4]), (3, [1]), (4, []), (5, [3, 8]), (7, []), (8, [9]), (9, [7]), (11, [4]), (13, [9, 14]), (14, [])]
>>> sorted((v, sorted(G.successeurs(v))) for v in G.sommets()) # Vérification des successeurs
[(1, [2, 3]), (2, [1]), (3, [1, 5]), (4, [1, 2, 11]), (5, []), (7, [9]), (8, [5]), (9, [8, 13]), (11, []), (13, []), (14, [13])]
>>> sorted((v, G.degre_entrant(v)) for v in G.sommets()) # Vérification des degrés entrants
[(1, 3), (2, 2), (3, 1), (4, 0), (5, 2), (7, 0), (8, 1), (9, 1), (11, 1), (13, 2), (14, 0)]
>>> sorted((v, G.degre_sortant(v)) for v in G.sommets()) # Vérification des degrés sortants
[(1, 2), (2, 1), (3, 2), (4, 3), (5, 0), (7, 1), (8, 1), (9, 2), (11, 0), (13, 0), (14, 1)]
>>> sorted(G.voisins(1)) # Vérification des voisins de 1
[2, 3, 4]
>>> sorted(G.voisins(9)) # Vérification des voisins de 9
[7, 8, 13]
>>> sorted(G.voisins(7)) # Vérification des voisins de 7
[9]
>>> G.retirer_sommet(9);sorted(G.voisins(7)) # Retirer 9 et vérification des voisins de 7
[]
>>> G.retirer_arc(3,1);sorted(map(list, G.arcs())) #  Vérification de retirer_arc
[[1, 2], [1, 3], [2, 1], [3, 5], [4, 1], [4, 2], [4, 11], [8, 5], [14, 13]]
>>> G.retirer_arcs([(4,1),(8,5),(14,13)]);sorted(map(list, G.arcs())) #  Vérification de retirer_arcs
[[1, 2], [1, 3], [2, 1], [3, 5], [4, 2], [4, 11]]
>>> G = GrapheOriente(); G.ajouter_arcs(CFC_INSTANCE_TD); G_induit = G.sous_graphe_induit([3,5,8,6,9,7]) #  Vérification de sous graphe induit connexe
>>> sorted(G_induit.sommets())
[3, 5, 6, 7, 8, 9]
>>> sorted(G_induit.arcs())
[(3, 5), (5, 6), (6, 7), (6, 9), (7, 9), (8, 5), (9, 8)]
>>> G_induit = G.sous_graphe_induit([4,3,13,12,11,6,7]); #  Vérification de sous graphe induit non connexe
>>> sorted(G_induit.sommets())
[3, 4, 6, 7, 11, 12, 13]
>>> sorted(G_induit.arcs())
[(4, 11), (4, 12), (6, 7), (11, 12), (13, 12)]
==

# Le grader:
#@ /grader/evaluator.py [grader.py]
evaluator==
grade=(100,"bravo")
==

# création de l'éditeur de code
editor.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé

==



