
# Test d'une classe Graphe implémentant un graphe pondéré non orienté.
@ /utils/sandboxio.py
@ unionfind.py
@ corrlib_graphes.py 
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Tester tout d'un coup!
text==
Rendu 3 : Ce rendu a pour sujet les graphes orientés

Écrivezles composantes suivantes (toutes les fonctions prennent des graphes orientés en paramètre):
<ul>
<li>une classe <strong>GrapheOriente</strong> implémentant l'interface décrite au cours;
<li>une fonction parcours_profondeur_oriente(graphe), qui renvoie un couple (sommets, parents) dans cet ordre, où:
<ul>
    <li>sommets est une liste contenant les sommets du graphe dans l'ordre de fin de visite.
    <li>parents est un dictionnaire ayant pour clés les sommets et pour valeur le parent de chaque sommet dans l'exploration en profondeur effectuée.
</ul>
Attention, votre fonction doit être correcte que le graphe soit ou non connexe (faiblement ou fortement). Tous les sommets du graphe doivent donc être listés. 
Parents permet de recontruire la forêt d'exploration en profondeur obtenue en utilisant la stratégie de parcours @labarre.
<li>une fonction detection_cycle(graphe), qui renvoie explicitement un cycle du graphe s'il en contient un et None sinon. Le type du cycle renvoyé doit être le même que celui du graphe en entrée.
<li>une fonction composantes_fortement_connexes(graphe), renvoyant les composantes fortement connexes sous la forme d'un itérable d'itérables de sommets.
On recommande des ensembles d'ensembles pour des raisons d'efficacité et parce que l'ordre n'importe pas, mais il est permis d'utiliser d'autres types tant que le format demandé est respecté.
</ul>


Ce rendu a pour sujet les graphes orientés. On vous demande d'écrire les composantes suivantes (toutes les fonctions prennent des graphes orientés en paramètre):

    une classe GrapheOriente implémentant l'interface décrite au cours; vous pouvez partir de la classe DictionnaireAdjacence disponible sur la page du cours;
    une fonction parcours_profondeur_oriente(graphe), qui renvoie les sommets du graphe dans l'ordre où le parcours en profondeur les découvrira un couple (sommets, parents) dans cet ordre, où:
        sommets est une liste contenant les sommets du graphe dans l'ordre de fin de visite (sommets[0] est le premier sommet dont on termine l'exploration, sommets[1] le second, et ainsi de suite)
        parents est un dictionnaire ayant pour clés les sommets et pour valeur le parent de chaque sommet dans l'exploration en profondeur effectuée.
    Attention, votre fonction doit être correcte que le graphe soit ou non connexe (faiblement ou fortement). Tous les sommets du graphe doivent donc être listés.
    une fonction detection_cycle(graphe), qui renvoie explicitement un cycle du graphe s'il en contient un et None sinon. Le type du cycle renvoyé doit être le même que celui du graphe en entrée.
    une fonction composantes_fortement_connexes(graphe), renvoyant les composantes fortement connexes sous la forme d'un itérable d'itérables de sommets. On recommande des ensembles d'ensembles pour des raisons d'efficacité et parce que l'ordre n'importe pas, mais il est permis d'utiliser d'autres types tant que le format demandé est respecté.

Comme on l'a vu au cours, la détection des cycles et des composantes fortement connexes ont toutes deux besoin de variantes du parcours en profondeur. Réfléchissez bien à la manière dont vous allez les implémenter pour éviter au maximum de dupliquer votre code.

Vous rendrez un seul fichier contenant votre classe GrapheOriente et toutes les fonctions demandées.

Pour vous aider, des jeux de tests seront mis à votre disposition sur la plateforme Platon.

Le rendu doit s'effectuer via cette plateforme et son échéance est fixée au dimanche 31/05/2020 à 23h55 sous la forme d'un unique fichier nommé VOTRENOM.py . Aucun rendu en retard ne sera évalué.

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


