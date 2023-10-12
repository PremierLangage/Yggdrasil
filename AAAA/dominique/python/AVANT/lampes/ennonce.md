
Parce que vos voisins ne cessent de vous battre au concours de décoration de maison de vacances année après année,
 vous avez décidé de déployer un million de lumières dans une grille 1000x1000.

De plus, parce que vous avez été particulièrement gentil cette année,
 le Père Noël vous a envoyé des instructions sur la façon d'afficher la configuration d'éclairage idéale.

Les lumières de votre grille sont numérotées de 0 à 999 dans chaque direction ;
 les lumières à chaque coin sont à 0,0, 0,999, 999,999 et 999,0. 
 Les instructions indiquent s'il faut activer, désactiver ou basculer diverses plages inclusives données sous forme de paires de coordonnées.
 Chaque paire de coordonnées représente les coins opposés d'un rectangle, inclus ;
  une paire de coordonnées comme 0,0 à 2,2 fait donc référence à 9 lumières dans un carré 3x3. Les lumières commencent toutes éteintes.

Pour vaincre vos voisins cette année, il ne vous reste plus qu'à installer vos lumières en suivant dans l'ordre les instructions 
que le Père Noël vous a envoyées.

Par example:

    allumer 0,0 à 999,999 allumerait (ou laisserait allumé) chaque lumière.
    basculer de 0,0 à 999,0 basculerait la première ligne de 1000 lumières, éteignant celles qui étaient allumées
     et allumant celles qui étaient éteintes.
    éteindre 499 499 à 500 500 éteindrait (ou laisserait éteint) les quatre voyants du milieu.
Exemple de lignes du fichier data :

    éteindre 301,3 : 808,453
    allumer 351,678 : 951,908
    basculer 720,196 : 897,994

Ecrivez une fonction question1() qui lit le fichier "data" et retourne le nombre de lumières allumées après avoir appliquer toutes les instructions.

Vous venez de terminer la mise en œuvre de votre motif de lumière gagnant lorsque vous vous rendez compte que vous avez mal traduit le message du Père Noël de l'Ancien Elfique Nordique.

La grille lumineuse que vous avez achetée a en fait des commandes de luminosité individuelles ; chaque lumière peut avoir une luminosité de zéro ou plus. Les lumières commencent toutes à zéro.

La phrase allumer signifie en fait que vous devez augmenter la luminosité de ces lumières de 1.

L'expression éteindre signifie en fait que vous devez diminuer la luminosité de ces lumières de 1, jusqu'à un minimum de zéro.

La phrase bascule signifie en fait que vous devez augmenter la luminosité de ces lumières de 2.

Quelle est la luminosité totale de toutes les lumières combinées après avoir suivi les instructions du Père Noël ?

Par example:

     activer 0,0 à 0,0 augmenterait la luminosité totale de 1.
     basculer de 0,0 à 999 999 augmenterait la luminosité totale de 2 000 000.

Ecrivez une fonction question2() qui lit le fichier "data" et retourne la luminosité totale après avoir appliqué toutes les instructions.

Pour le fichier exemple les réponses sont 377891 et 14110788.