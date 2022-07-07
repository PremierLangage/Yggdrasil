** BRAVO VOUS ETES A LA DEUXIEME PARTIE**


--- Deuxième Partie ---

Ensuite, vous devez vérifier la cote de survie, qui peut être déterminée en multipliant la cote du générateur d'oxygène par la cote de l'épurateur de CO2.

La cote du générateur d'oxygène et la cote de l'épurateur de CO2 sont des valeurs qui peuvent être trouvées dans votre rapport de diagnostic - les trouver est la partie délicate. 
Les deux valeurs sont localisées à l'aide d'un processus similaire qui consiste à filtrer les valeurs jusqu'à ce qu'il n'en reste qu'une seule. Avant de rechercher l'une ou l'autre des valeurs de notation, 
commencez par la liste complète des nombres binaires de votre rapport de diagnostic et considérez uniquement le premier bit de ces nombres. Alors:

    - Conservez uniquement les nombres sélectionnés par les critères de bit pour le type de valeur de notation que vous recherchez. Ignorer les nombres qui ne correspondent pas aux critères de bit.
    
    - S'il ne vous reste qu'un seul numéro, arrêtez-vous; il s'agit de la valeur de notation que vous recherchez.
    
    - Sinon, répétez le processus, en considérant le bit suivant vers la droite.

Les critères de bit dépendent du type de valeur de notation que vous souhaitez rechercher :

    - Pour trouver la valeur nominale du générateur d'oxygène, déterminez la valeur la plus courante (0 ou 1) dans la position actuelle du bit et ne conservez que les nombres avec ce bit dans cette position. 
      Si 0 et 1 sont également communs, conservez les valeurs avec un 1 dans la position considérée.

    - Pour trouver la cote de l'épurateur de CO2, déterminez la valeur la plus commune (0 ou 1) dans la position actuelle du bit et ne conservez que les nombres avec ce bit dans cette position. 
      Si 0 et 1 sont également communs, conserver les valeurs avec un 0 dans la position considérée.

Par exemple, pour déterminer la valeur nominale du générateur d'oxygène à l'aide du même exemple de rapport de diagnostic ci-dessus :

    - Commencez avec les 12 nombres et ne considérez que le premier bit de chaque nombre. Il y a plus de bits 1 (7) que de bits 0 (5), donc ne gardez que les 7 chiffres avec un 1 en première position : 
      11110, 10110, 10111, 10101, 11100, 10000 et 11001.

    - Considérons ensuite le second bit des 7 nombres restants : il y a plus de 0 bits (4) que de 1 bits (3), donc ne gardez que les 4 nombres avec un 0 en deuxième position : 10110, 10111, 10101 et 10000.

    - En troisième position, trois des quatre nombres ont un 1, alors gardez ces trois : 10110, 10111 et 10101.

    - En quatrième position, deux des trois nombres ont un 1, alors gardez ces deux : 10110 et 10111.

    - En cinquième position, il y a un nombre égal de bits 0 et de bits 1 (un chacun). Donc, pour trouver la cote du générateur d'oxygène, gardez le nombre avec un 1 dans cette position : 10111.
    
    - Comme il ne reste qu'un seul numéro, arrêtez-vous; la cote du générateur d'oxygène est de 10111, soit 23 en décimal.

Ensuite, pour déterminer la valeur nominale de l'épurateur de CO2 à partir du même exemple ci-dessus :

    - Recommencez avec les 12 nombres et ne considérez que le premier bit de chaque nombre. Il y a moins de 0 bits (5) que de 1 bits (7), donc ne gardez que les 5 chiffres avec un 0 en première position : 
      00100, 01111, 00111, 00010 et 01010.

    - Ensuite, considérons le second bit des 5 nombres restants : il y a moins de 1 bits (2) que de 0 bits (3), donc ne gardez que les 2 nombres avec un 1 en deuxième position : 01111 et 01010.

    - En troisième position, il y a un nombre égal de bits 0 et de bits 1 (un chacun). Ainsi, pour trouver la cote de l'épurateur de CO2, conservez le nombre avec un 0 à cette position : 01010.

    - Comme il ne reste qu'un seul numéro, arrêtez-vous; la cote de l'épurateur de CO2 est 01010, ou 10 en décimal.

Enfin, pour trouver la cote de survie, multipliez la cote du générateur d'oxygène (23) par la cote de l'épurateur de CO2 (10) pour obtenir 230.

Vous devez écrire une fonction Question1() qui lit le fichier "data" avec les nombres binaires de votre rapport de diagnostic, qui calcule la cote du générateur d'oxygène et la cote de l'épurateur de CO2 et renvoie le produit des deux. 
Quelle est la cote de survie du sous-marin ? (Assurez-vous de représenter votre réponse en décimal et non en binaire.)
