
# Test d'une classe Graphe implémentant un graphe pondéré non orienté.
@ /utils/sandboxio.py
@ corrlib_graphes.py 
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Rendu 3 - Tester tout d'un coup!
text==
Écrivez les composantes suivantes (toutes les fonctions prennent des graphes orientés en paramètre):
<ul>
<li>une classe <strong>GrapheOriente</strong> implémentant l'interface décrite au cours;
<li>une fonction parcours_profondeur_oriente(graphe), qui renvoie un couple (sommets, parents) dans cet ordre, où:
<ul>
    <li>sommets est une liste contenant les sommets du graphe dans l'ordre de fin de visite;
    <li>parents est un dictionnaire ayant pour clés les sommets et pour valeur le parent de chaque sommet dans l'exploration en profondeur effectuée.
</ul>
Attention, votre parcours doit respacter l'ordre lexicographique des sommets (@Labarre) et vous devez bien sûr explorer tout le graphe qu'il soit ou non connexe (faiblement ou fortement). Tous les sommets du graphe doivent donc être listés.
<li>une fonction detection_cycle(graphe), qui renvoie explicitement un cycle du graphe s'il en contient un et None sinon. Le type du cycle renvoyé doit être le même que celui du graphe en entrée;
<li>une fonction composantes_fortement_connexes(graphe), renvoyant les composantes fortement connexes sous la forme d'un itérable d'itérables de sommets.
</ul>

Comme on l'a vu au cours, la détection des cycles et des composantes fortement connexes ont toutes deux besoin de variantes du parcours en profondeur.
Réfléchissez bien à la manière dont vous allez les implémenter pour éviter au maximum de dupliquer votre code.
==

# Mon code
before==
import corrlib_graphes

==


############################## Ajouter ici les doc test #######################################

testname0 = Vérifications de la classe GrapheOriente
# Tests d'indices non consécutifs pour les sommets => exclusion des listes et matrices d'adjacence
pltest0== 
>>> from corrlib_graphes import CFC_INSTANCE_TD #
>>> G = GrapheOriente(); G.ajouter_arcs(CFC_INSTANCE_TD) # initialisation de l'instance du TD
>>> sorted(G.sommets()) # Vérification de l'ensemble des sommets
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
>>> sorted(map(list, G.arcs())) # Vérification de l'ensemble des arcs
[[1, 2], [1, 3], [2, 1], [3, 1], [3, 5], [4, 1], [4, 2], [4, 11], [4, 12], [5, 6], [6, 7], [6, 9], [7, 9], [8, 5], [8, 10], [9, 8], [9, 10], [9, 13], [10, 11], [10, 13], [11, 12], [12, 10], [12, 14], [13, 12], [14, 13]]
>>> for (u,v) in [(12,10),(10,42),(100,42)]: # Vérification de contient_arc
...     G.contient_arc(u,v)#
... 
True
False
False
>>> for s in [9,4,0,42]: # Vérification de contient_sommet
...     G.contient_sommet(s)#
... 
True
True
False
False
>>> G.retirer_sommet(6); sorted(G.sommets()) # Vérification de l'ensemble des sommets après suppression de 6
[1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14]
>>> sorted(map(list, G.arcs())) # Vérification de l'ensemble des arcs
[[1, 2], [1, 3], [2, 1], [3, 1], [3, 5], [4, 1], [4, 2], [4, 11], [4, 12], [7, 9], [8, 5], [8, 10], [9, 8], [9, 10], [9, 13], [10, 11], [10, 13], [11, 12], [12, 10], [12, 14], [13, 12], [14, 13]]
>>> G.nombre_sommets() # Vérification du nombre de sommets
13
>>> G.nombre_arcs() # Vérification du nombre d'arcs
22
>>> G.retirer_sommets([12,10]); sorted((v, sorted(G.predecesseurs(v))) for v in G.sommets()) # suppression de 10 et 12 et vérification des prédécesseurs
[(1, [2, 3, 4]), (2, [1, 4]), (3, [1]), (4, []), (5, [3, 8]), (7, []), (8, [9]), (9, [7]), (11, [4]), (13, [9, 14]), (14, [])]
>>> sorted((v, sorted(G.successeurs(v))) for v in G.sommets()) # Vérification des successeurs
[(1, [2, 3]), (2, [1]), (3, [1, 5]), (4, [1, 2, 11]), (5, []), (7, [9]), (8, [5]), (9, [8, 13]), (11, []), (13, []), (14, [13])]
>>> sorted((v, G.degre_entrant(v)) for v in G.sommets()) # Vérification des degrés entrants
[(1, 3), (2, 2), (3, 1), (4, 0), (5, 2), (7, 0), (8, 1), (9, 1), (11, 1), (13, 2), (14, 0)]
>>> sorted((v, G.degre_sortant(v)) for v in G.sommets()) # Vérification des degrés sortants
[(1, 2), (2, 1), (3, 2), (4, 3), (5, 0), (7, 1), (8, 1), (9, 2), (11, 0), (13, 0), (14, 1)]
>>> for s in [1,9,7]: # Vérification de voisins
...     sorted(G.voisins(s))#
... 
[2, 3, 4]
[7, 8, 13]
[9]
>>> G.retirer_sommet(9);sorted(G.voisins(7)) # Suppression de 9 et vérification des voisins de 7
[]
>>> G.retirer_arc(3,1);sorted(map(list, G.arcs())) #  Vérification de retirer_arc
[[1, 2], [1, 3], [2, 1], [3, 5], [4, 1], [4, 2], [4, 11], [8, 5], [14, 13]]
>>> G.retirer_arcs([(4,1),(8,5),(14,13)]);sorted(map(list, G.arcs())) #  Vérification de retirer_arcs
[[1, 2], [1, 3], [2, 1], [3, 5], [4, 2], [4, 11]]
>>> G = GrapheOriente(); G.ajouter_arcs(CFC_INSTANCE_TD); G_induit = G.sous_graphe_induit([3,5,8,6,9,7]);sorted(G_induit.sommets());sorted(G_induit.arcs())#  Vérification de sous graphe induit connexe
[3, 5, 6, 7, 8, 9]
[(3, 5), (5, 6), (6, 7), (6, 9), (7, 9), (8, 5), (9, 8)]
>>> G_induit = G.sous_graphe_induit([4,3,13,12,11,6,7]);sorted(G_induit.sommets());sorted(G_induit.arcs()) #  Vérification de sous graphe induit non connexe
[3, 4, 6, 7, 11, 12, 13]
[(4, 11), (4, 12), (6, 7), (11, 12), (13, 12)]
==



############################## Fin des doc test #######################################

# Le grader:
#@ /grader/evaluator.py [grader.py]
evaluator==


grade=(100,"Tout semble correct. Bravo!!")
==

#
# création de l'éditeur de code
editor.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé

==




