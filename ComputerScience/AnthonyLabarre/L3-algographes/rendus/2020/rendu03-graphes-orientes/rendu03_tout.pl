
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


