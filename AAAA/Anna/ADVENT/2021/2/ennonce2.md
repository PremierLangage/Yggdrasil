** BRAVO VOUS ETES A LA DEUXIEME PARTIE**


--- Deuxième Partie ---

D'après vos calculs, le cours prévu ne semble pas avoir de sens. Vous trouvez le manuel du sous-marin et découvrez que le processus est en fait un peu plus compliqué.

En plus de la position horizontale et de la profondeur, vous devrez également suivre une troisième valeur, visée, qui commence également à 0. Les commandes signifient également quelque chose de complètement différent de ce que vous pensiez au départ :

vers le bas X augmente votre objectif de X unités.
jusqu'à X diminue votre objectif de X unités.
l'attaquant X fait deux choses :
Il augmente votre position horizontale de X unités.
Il augmente votre profondeur par votre objectif multiplié par X.
Notez à nouveau que puisque vous êtes sur un sous-marin, le bas et le haut font le contraire de ce à quoi vous pourriez vous attendre : "bas" signifie viser dans la direction positive.

Maintenant, l'exemple ci-dessus fait quelque chose de différent :

vers l'avant 5 ajoute 5 à votre position horizontale, un total de 5. Parce que votre objectif est 0, votre profondeur ne change pas.
down 5 ajoute 5 à votre objectif, ce qui donne une valeur de 5.
avant 8 ajoute 8 à votre position horizontale, un total de 13. Parce que votre objectif est 5, votre profondeur augmente de 8*5=40.
jusqu'à 3 diminue votre objectif de 3, ce qui donne une valeur de 2.
8 vers le bas ajoute 8 à votre objectif, ce qui donne une valeur de 10.
vers l'avant 2 ajoute 2 à votre position horizontale, un total de 15. Parce que votre objectif est de 10, votre profondeur augmente de 2*10=20 pour un total de 60.
Après avoir suivi ces nouvelles instructions, vous auriez une position horizontale de 15 et une profondeur de 60. (En les multipliant, vous obtenez 900.)

En utilisant cette nouvelle interprétation des commandes, vous devez écrire une fonction Question2() qui lit le fichier "data" avec les données et qui retourne la position horizontale et la profondeur que vous auriez après avoir suivi le parcours prévu. Qu'obtenez-vous si vous multipliez votre position horizontale finale par votre profondeur finale ?