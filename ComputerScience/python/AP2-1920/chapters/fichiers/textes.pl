
author= DR


tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = ceci n'est pas un exercice 

text=

text3_1 ==

Le sous-marin a fait des craquements étranges, alors vous lui demandez de produire un rapport de diagnostic au cas où.

Le rapport de diagnostic (votre entrée de puzzle) se compose d'une liste de nombres binaires qui, une fois décodés correctement, peuvent vous dire beaucoup de choses utiles sur les conditions du sous-marin. Le premier paramètre à vérifier est la consommation électrique.

Vous devez utiliser les nombres binaires du rapport de diagnostic pour générer deux nouveaux nombres binaires (appelés taux gamma et taux epsilon). La consommation d'énergie peut alors être trouvée en multipliant le taux gamma par le taux epsilon.

Chaque bit du taux gamma peut être déterminé en trouvant le bit le plus commun dans la position correspondante de tous les nombres dans le rapport de diagnostic. Par exemple, étant donné le rapport de diagnostic suivant :

00100  
11110  
10110  
10111  
10101  
01111  
00111  
11100  
10000  
11001  
00010  
01010  

En ne considérant que le premier bit de chaque nombre, il y a cinq 0 bits et sept 1 bits. Étant donné que le bit le plus courant est 1, le premier bit du taux gamma est 1.

Le deuxième bit le plus courant des nombres dans le rapport de diagnostic est 0, donc le deuxième bit du taux gamma est 0.

La valeur la plus courante des troisième, quatrième et cinquième bits est 1, 1 et 0, respectivement, et les trois derniers bits du taux gamma sont donc 110.

Ainsi, le taux gamma est le nombre binaire 10110, soit 22 en décimal.

Le taux epsilon est calculé de la même manière ; plutôt que d'utiliser le bit le plus commun, le bit le moins commun de chaque position est utilisé. Ainsi, le taux epsilon est 01001, soit 9 en décimal. La multiplication du taux gamma (22) par le taux epsilon (9) produit la consommation d'énergie, 198.

Utilisez les nombres binaires de votre rapport de diagnostic pour calculer le taux gamma et le taux epsilon, puis multipliez-les ensemble. Quelle est la consommation électrique du sous-marin ? (Assurez-vous de représenter votre réponse en décimal, pas en binaire.)
==

before==

text = text3_2

==

text3_2==
Maintenant, vous devez vérifier la cote de survie, qui peut être déterminée en multipliant la cote du générateur d'oxygène par la cote de l'épurateur de CO2.

La cote du générateur d'oxygène et la cote du laveur de CO2 sont des valeurs qui peuvent être trouvées dans votre rapport de diagnostic -
 les trouver est la partie la plus délicate. Les deux valeurs sont localisées à l'aide d'un processus similaire qui consiste à filtrer les valeurs 
 jusqu'à ce qu'il n'en reste qu'une. Avant de rechercher l'une ou l'autre des valeurs d'évaluation, commencez par la liste complète des nombres binaires
  de votre rapport de diagnostic et ne considérez que le premier bit de ces nombres. Puis:

Conservez uniquement les nombres sélectionnés par les critères de bits pour le type de valeur d'évaluation que vous recherchez. Ignorez les nombres qui ne correspondent pas aux critères de bit.
S'il ne vous reste plus qu'un numéro, arrêtez-vous ; il s'agit de la valeur d'évaluation que vous recherchez.
Sinon, répétez le processus en considérant le bit suivant à droite.

Les critères de bits dépendent du type de valeur de notation que vous souhaitez rechercher :

Pour trouver la valeur nominale du générateur d'oxygène, déterminez la valeur la plus courante (0 ou 1) dans la position actuelle du bit et ne conservez que les chiffres avec ce bit dans cette position. Si 0 et 1 sont également communs, conservez les valeurs avec un 1 dans la position considérée.
Pour trouver la cote de l'épurateur de CO2, déterminez la valeur la moins commune (0 ou 1) dans la position actuelle du bit et ne conservez que les nombres avec ce bit dans cette position. Si 0 et 1 sont également communs, conservez les valeurs avec un 0 dans la position considérée.


00100  
11110  
10110  
10111  
10101  
01111  
00111  
11100  
10000  
11001  
00010  
01010  


Par exemple, pour déterminer la valeur nominale du générateur d'oxygène à l'aide du même exemple de rapport de diagnostic ci-dessus :

Commencez avec les 12 nombres et ne considérez que le premier bit de chaque nombre. Il y a plus de 1 bits (7) que de 0 bits (5), donc ne gardez que les 7 nombres 
avec un 1 en première position : 11110, 10110, 10111, 10101, 11100, 10000 et 11001.
Ensuite, considérons le deuxième bit des 7 nombres restants : il y a plus de 0 bits (4) que de 1 bits (3), donc ne gardez que les 4 nombres avec un 0 en deuxième position : 10110, 10111, 10101 et 10000.
En troisième position, trois des quatre nombres ont un 1, alors gardez ces trois : 10110, 10111 et 10101.
En quatrième position, deux des trois nombres ont un 1, alors gardez ces deux : 10110 et 10111.
En cinquième position, il y a un nombre égal de 0 bits et 1 bits (un chacun). Donc, pour trouver la cote du générateur d'oxygène, gardez le nombre avec un 1 dans cette position : 10111.
Comme il ne reste plus qu'un numéro, arrêtez-vous ; la cote du générateur d'oxygène est de 10111, ou 23 en décimal.

Ensuite, pour déterminer la valeur d'évaluation du laveur de CO2 à partir du même exemple ci-dessus :

Recommencez avec les 12 nombres et ne considérez que le premier bit de chaque nombre. Il y a moins de 0 bits (5) que de 1 bits (7), donc ne gardez que les 5 nombres avec un 0 en première position : 00100, 01111, 00111, 00010 et 01010.
Ensuite, considérons le deuxième bit des 5 nombres restants : il y a moins de 1 bit (2) que de 0 bit (3), donc ne gardez que les 2 nombres avec un 1 en deuxième position : 01111 et 01010.
En troisième position, il y a un nombre égal de 0 bits et 1 bits (un chacun). Donc, pour trouver la cote de l'épurateur de CO2, gardez le nombre avec un 0 dans cette position : 01010.
Comme il ne reste plus qu'un numéro, arrêtez-vous ; la cote de l'épurateur de CO2 est 01010, ou 10 en décimal.

Enfin, pour trouver la cote de survie, multipliez la cote du générateur d'oxygène (23) par la cote de l'épurateur de CO2 (10) pour obtenir 230.

Utilisez les nombres binaires de votre rapport de diagnostic pour calculer la cote du générateur d'oxygène et la cote du laveur de CO2, puis multipliez-les ensemble. Quelle est la cote de survie du sous-marin? (Assurez-vous de représenter votre réponse en décimal, pas en binaire.)
==

text1_1==
Vous vous occupez de vos affaires sur un navire en mer lorsque l'alarme à la mer se déclenche ! Vous vous précipitez pour voir si vous pouvez aider. Apparemment, l'un des Elfes a trébuché et a accidentellement envoyé les clés du traîneau dans l'océan !

Avant de vous en rendre compte, vous êtes à l'intérieur d'un sous-marin que les Elfes gardent prêt à faire face à de telles situations. Il est couvert de lumières de Noël (parce que c'est bien le cas), et il a même une antenne expérimentale qui devrait être capable de suivre les clés si vous pouvez augmenter suffisamment la force de son signal ; il y a un petit compteur qui indique la force du signal de l'antenne en affichant 0-50 étoiles.

Votre instinct vous dit que pour sauver Noël, vous devrez obtenir les cinquante étoiles d'ici le 25 décembre.

Collectez des étoiles en résolvant des énigmes. Deux puzzles seront mis à disposition chaque jour du calendrier de l'Avent ; le deuxième puzzle est déverrouillé lorsque vous terminez le premier. Chaque puzzle accorde une étoile. Bonne chance!

Lorsque le sous-marin descend sous la surface de l'océan, il effectue automatiquement un balayage par sonar du fond marin à proximité. Sur un petit écran, le rapport de balayage du sonar (votre entrée de puzzle) apparaît : chaque ligne est une mesure de la profondeur du fond marin alors que le balayage regarde de plus en plus loin du sous-marin.

Par exemple, supposons que vous ayez le rapport suivant :

199  
200  
208  
210  
200  
207  
240  
269  
260  
263  

Ce rapport indique qu'en balayant vers l'extérieur depuis le sous-marin, le balayage du sonar a trouvé des profondeurs de 199, 200, 208, 210, etc.

Le premier ordre du jour est de déterminer à quelle vitesse la profondeur augmente, juste pour que vous sachiez à quoi vous avez affaire - vous ne savez jamais si les clés seront emportées dans des eaux plus profondes par un courant océanique ou un poisson ou quelque chose.

Pour ce faire, comptez le nombre de fois qu'une mesure de profondeur augmente par rapport à la mesure précédente. (Il n'y a pas de mesure avant la première mesure.) Dans l'exemple ci-dessus, les modifications sont les suivantes :

199 (N/A - aucune mesure précédente)  
200 (augmenté)  
208 (augmenté)  
210 (augmenté)  
200 (diminué)  
207 (augmenté)  
240 (augmenté)  
269 ​​(augmenté)  
260 (diminué)  
263 (augmenté)  
  
Dans cet exemple, il y a 7 mesures qui sont plus grandes que la mesure précédente.

Combien de mesures sont plus grandes que la mesure précédente ?
==

text1_2==

Considérer chaque mesure n'est pas aussi utile que vous le pensiez : il y a tout simplement trop de bruit dans les données.

Au lieu de cela, considérez les sommes d'une fenêtre glissante à trois mesures. En considérant à nouveau l'exemple ci-dessus :

199 A
200 A B
208 A B C
210 B C D
200 E C D
207 E F D
240 E F G
269 ​​F G H
260 G H
263 H

Commencez par comparer les première et deuxième fenêtres de trois mesures. Les mesures dans la première fenêtre sont notées A (199, 200, 208) ; leur somme est de 199 + 200 + 208 = 607. La deuxième fenêtre est notée B (200, 208, 210) ; sa somme est de 618. La somme des mesures dans la deuxième fenêtre est plus grande que la somme de la première, donc cette première comparaison a augmenté.

Votre objectif est maintenant de compter le nombre de fois où la somme des mesures dans cette fenêtre glissante augmente par rapport à la somme précédente. Donc, comparez A avec B, puis comparez B avec C, puis C avec D, et ainsi de suite. Arrêtez-vous lorsqu'il ne reste plus assez de mesures pour créer une nouvelle somme de trois mesures.

Dans l'exemple ci-dessus, la somme de chaque fenêtre de trois mesures est la suivante :

A : 607 (N/A - pas de somme précédente)
B : 618 (augmenté)
C: 618 (pas de changement)
D : 617 (diminué)
E : 647 (augmenté)
F : 716 (augmenté)
G : 769 (augmenté)
H : 792 (augmenté)

Dans cet exemple, il y a 5 sommes qui sont plus grandes que la somme précédente.

Considérons les sommes d'une fenêtre coulissante à trois mesures. Combien de sommes sont plus grandes que la somme précédente ?


==

