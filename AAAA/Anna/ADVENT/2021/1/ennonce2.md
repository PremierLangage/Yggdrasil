** BRAVO VOUS ETES A LA DEUXIEME PARTIE**


--- Deuxième Partie ---

Considérer chaque mesure n'est pas aussi utile que prévu : il y a tout simplement trop de bruit dans les données.

Au lieu de cela, considérez les sommes d'une fenêtre glissante à trois mesures. Considérant à nouveau l'exemple ci-dessus:

    199  A      
    200  A B    
    208  A B C  
    210    B C D
    200  E   C D
    207  E F   D
    240  E F G  
    269    F G H
    260      G H
    263        H

Commencez par comparer les première et deuxième fenêtres de trois mesures. Les mesures dans la première fenêtre sont marquées A (199, 200, 208) ; leur somme est 199 + 200 + 208 = 607. 
La deuxième fenêtre est notée B (200, 208, 210) ; sa somme est de 618. La somme des mesures dans la deuxième fenêtre est supérieure à la somme de la première, donc cette première comparaison a augmenté.

Votre objectif est maintenant de compter le nombre de fois que la somme des mesures dans cette fenêtre glissante augmente par rapport à la somme précédente. 
Alors, comparez A avec B, puis comparez B avec C, puis C avec D, et ainsi de suite. Arrêtez-vous lorsqu'il ne reste plus assez de mesures pour créer une nouvelle somme de trois mesures.

Dans l'exemple ci-dessus, la somme de chaque fenêtre de trois mesures est la suivante :

    A : 607 (N/A - pas de somme précédente)
    B : 618 (augmenté)
    C : 618 (pas de changement)
    D : 617 (diminué)
    E : 647 (augmenté)
    F : 716 (augmenté)
    G : 769 (augmenté)
    H : 792 (augmenté)

Dans cet exemple, il y a 5 sommes qui sont plus grandes que la somme précédente.
Vous devez écrire une fonction Question2() qui lit le fichier "data" avec les données et qui retourne le nombre de
sommes sont supérieures à la somme précédente 