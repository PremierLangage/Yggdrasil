
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
    <li>parents est un dictionnaire ayant pour clés des sommets et pour valeur le parent du sommet correspondant dans l'exploration en profondeur effectuée.
</ul>
Attention, votre parcours doit respecter l'ordre lexicographique des sommets et vous devez bien sûr explorer tout le graphe qu'il soit 
ou non connexe (faiblement ou fortement). Tous les sommets du graphe doivent donc être listés.
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

testname1 = Vérifications de parcours_profondeur_oriente sur l'exemple du TD 5 exercice 1
pltest1==
>>> from corrlib_graphes import * #
>>> G = GrapheOriente(); G.ajouter_arcs(CYCLE_ORIENTE_INSTANCE_TD) # initialisation de l'instance du TD
>>> sommets, parents = parcours_profondeur_oriente(G) # Appel de la fonction parcours_profondeur_oriente
>>> foret = reconstruire_arbre_oriente(sommets, parents, GrapheOriente) # Reconstruction de la forêt à partir de parents
>>> sorted(foret.sommets()) == sorted(G.sommets())  # tous les sommets sont-ils couverts?
True
>>> ma_foret = foret_parcours_profondeur_oriente(G); arcs_de_ma_foret = set(ma_foret.arcs())#
>>> for arbre in cc_graphes(foret): # 
...     if not est_arbre_oriente(arbre): # tous les sous-graphes de la forêt sont-ils des arbres?
...         print("le sous-graphe suivant de la forêt n'est pas un arbre orienté") #
...         print("    sommets:", arbre.sommets()) #
...         print("    arcs:   ", arbre.arcs()) #
>>> set(foret.arcs()) == set(ma_foret.arcs()) # Vérification que la foret est bien celle du parcours en profondeur avec la convention vue en cours.
True
>>> dates_attendues = profondeur_dates_fin(G); ordre_attendu = sorted(dates_attendues, key=dates_attendues.__getitem__) #
>>> if sommets != ordre_attendu: # Vérification de l'ordre des sommets renvoyés par parcours_profondeur_oriente
...     print("ordre attendu:", ordre_attendu) 
...     print("ordre obtenu: ", sommets) 
==

testname2 = Vérifications de parcours_profondeur_oriente sur l'exemple du TD 5 exercice 3
pltest2==
>>> from corrlib_graphes import * #
>>> G = GrapheOriente(); G.ajouter_arcs(CFC_INSTANCE_TD) # initialisation de l'instance du TD
>>> sommets, parents = parcours_profondeur_oriente(G)# Appel de la fonction parcours_profondeur_oriente
>>> foret = reconstruire_arbre_oriente(sommets, parents, GrapheOriente)# Reconstruction de la forêt à partir de parents
>>> sorted(foret.sommets()) == sorted(G.sommets())  # tous les sommets sont-ils couverts?
True
>>> ma_foret = foret_parcours_profondeur_oriente(G); arcs_de_ma_foret = set(ma_foret.arcs())#
>>> for arbre in cc_graphes(foret): # 
...     if not est_arbre_oriente(arbre): # tous les sous-graphes de la forêt sont-ils des arbres?
...         print("le sous-graphe suivant de la forêt n'est pas un arbre orienté")
...         print("    sommets:", arbre.sommets())
...         print("    arcs:   ", arbre.arcs())
>>> set(foret.arcs()) == set(ma_foret.arcs()) # Vérification que la foret est bien celle du parcours en profondeur avec la convention vue en cours.
True
>>> dates_attendues = profondeur_dates_fin(G); ordre_attendu = sorted(dates_attendues, key=dates_attendues.__getitem__)#
>>> if sommets != ordre_attendu: # Vérification de l'ordre des sommets renvoyés par parcours_profondeur_oriente
...     print("ordre attendu:", ordre_attendu) 
...     print("ordre obtenu: ", sommets) 
==

testname3 = Vérifications de parcours_profondeur_oriente sur un graphe orienté aléatoire
pltest3==
>>> from corrlib_graphes import * #
>>> G = GrapheOriente(); G.ajouter_arcs(graphe_oriente_aleatoire(10).edges()) # initialisation d'un graphe orienté aléatoire
>>> sommets, parents = parcours_profondeur_oriente(G)# Appel de la fonction parcours_profondeur_oriente
>>> foret = reconstruire_arbre_oriente(sommets, parents, GrapheOriente)# Reconstruction de la forêt à partir de parents
>>> sorted(foret.sommets()) == sorted(G.sommets())  # tous les sommets sont-ils couverts?
True
>>> ma_foret = foret_parcours_profondeur_oriente(G); arcs_de_ma_foret = set(ma_foret.arcs())#
>>> for arbre in cc_graphes(foret): # 
...     if not est_arbre_oriente(arbre):# tous les sous-graphes de la forêt sont-ils des arbres?
...         print("le sous-graphe suivant de la forêt n'est pas un arbre orienté")
...         print("    sommets:", arbre.sommets())
...         print("    arcs:   ", arbre.arcs())
>>> set(foret.arcs()) == set(ma_foret.arcs()) # Vérification que la foret est bien celle du parcours en profondeur avec la convention vue en cours.
True
>>> dates_attendues = profondeur_dates_fin(G); ordre_attendu = sorted(dates_attendues, key=dates_attendues.__getitem__)#
>>> if sommets != ordre_attendu: # Vérification de l'ordre des sommets renvoyés par parcours_profondeur_oriente
...     print("ordre attendu:", ordre_attendu) 
...     print("ordre obtenu: ", sommets) 
==

testname4 = Vérifications de detection_cycle sur l'exemple du cours
pltest4==
>>> from corrlib_graphes import CYCLE_ORIENTE_INSTANCE_COURS #
>>> G = GrapheOriente(); G.ajouter_arcs(CYCLE_ORIENTE_INSTANCE_COURS) # initialisation de l'instance du cours
>>> cycle = detection_cycle(G) # Appel de la fonction detection_cycle
>>> sorted(cycle.arcs()) # Vérification du résultat
[(0, 3), (3, 4), (4, 0)]
==

testname5 = Vérifications de detection_cycle sur l'exemple du TD
pltest5==
>>> from corrlib_graphes import * #
>>> G = GrapheOriente(); G.ajouter_arcs(CYCLE_ORIENTE_INSTANCE_TD) # initialisation de l'instance du TD
>>> arcs_cycle_trouve = set(detection_cycle(G).arcs())# Appel de la fonction detection_cycle
>>> cycles_possibles = cycles_simples(G)#
>>> if arcs_cycle_trouve not in cycles_possibles: # Vérification du résultat
...     print("les arcs identifiés:", arcs_cycle_trouve, "ne constituent pas un cycle du graphe")
...     print("cycles possibles:", cycles_possibles)
==

testname6 = Vérifications de detection_cycle sur un DAG aléatoire
pltest6==
>>> from corrlib_graphes import * #
>>> G = GrapheOriente(); G.ajouter_arcs(list(graphe_oriente_acyclique_aleatoire(20).edges())) # initialisation d'un DAG aléatoire
>>> obtenu = detection_cycle(G)# Appel de la fonction detection_cycle
>>> if obtenu is not None:# Vérification du résultat
...     print("la fonction identifie le cycle", obtenu.arcs(), " mais le graphe est acyclique")
...     print("ses arcs:", G.arcs())
==

testname7 = Vérifications de detection_cycle sur un graphe orienté aléatoire
pltest7==
>>> from corrlib_graphes import * #
>>> G = GrapheOriente(); G.ajouter_arcs(list(graphe_oriente_aleatoire(10).edges())) # initialisation d'un graphe orienté aléatoire
>>> obtenu = detection_cycle(G)# Appel de la fonction detection_cycle
>>> mon_cycle = cycle_oriente(G)#
>>> if obtenu is None: # Vérification du résultat si aucun cycle n'est détecté
...     if mon_cycle:
...         print("la fonction ne trouve pas de cycle alors que le graphe en contient un formé par les arcs", mon_cycle.arcs())
... else: # Vérification du résultat si un cycle est détecté
...     if mon_cycle: # cas graphe cyclique
...         if not est_cycle_oriente(obtenu, G):
...             print("le cycle identifié n'est pas valide")
...     else: # cas graphe acyclique
...         print("la fonction identifie le cycle", obtenu.arcs(), " mais le graphe est acyclique")
==


testname8 = Vérifications de composantes_fortement_connexes sur l'exemple du cours
pltest8==
>>> from corrlib_graphes import CFC_INSTANCE_COURS #
>>> G = GrapheOriente(); G.ajouter_arcs(CFC_INSTANCE_COURS) # initialisation de l'instance du cours
>>> cfc = composantes_fortement_connexes(G) # Calcul des cfc
>>> sorted(map(sorted, cfc)) # vérification du résultat
[[0, 1, 4], [2, 3], [5, 6], [7]]
==

testname9 = Vérifications de composantes_fortement_connexes sur l'exemple du TD
pltest9==
>>> from corrlib_graphes import CFC_INSTANCE_TD #
>>> G = GrapheOriente(); G.ajouter_arcs(CFC_INSTANCE_TD) # initialisation de l'instance du TD
>>> cfc = composantes_fortement_connexes(G) # Calcul des cfc
>>> sorted(map(sorted, cfc))# vérification du résultat
[[1, 2, 3], [4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14]]
==

testname10 = Vérifications de composantes_fortement_connexes sur une instance aléatoire
pltest10==
>>> from corrlib_graphes import * #
>>> G = GrapheOriente(); G.ajouter_arcs(list(graphe_oriente_aleatoire(20).edges())) # initialisation d'une instance aléatoire
>>> attendu = sorted(map(sorted, cfc(G)))#
>>> obtenu = sorted(map(sorted, composantes_fortement_connexes(G)))# Calcul des cfc
>>> if obtenu != attendu: # vérification du résultat
...     print("CFC obtenues =", obtenu, ";\n CFC attendues =", attendu) # 
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








