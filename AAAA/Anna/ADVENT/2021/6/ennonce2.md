** BRAVO VOUS ETES A LA DEUXIEME PARTIE**


--- Deuxième Partie ---

Les crabes ne semblent pas intéressés par la solution que vous proposez. Peut-être avez-vous mal compris l'ingénierie du crabe ?

Il s'avère que les moteurs des sous-marins crabes ne consomment pas de carburant à un rythme constant. Au lieu de cela, chaque changement d'un pas en position horizontale coûte 1 unité de carburant de plus que le précédent : le premier pas coûte 1, le deuxième pas coûte 2, le troisième pas coûte 3, et ainsi de suite.

Au fur et à mesure que chaque crabe se déplace, se déplacer plus loin devient plus coûteux. Cela change la meilleure position horizontale pour les aligner tous ; dans l'exemple ci-dessus, cela devient 5 :

    Passer de 16 à 5 : 66 carburant
    Passer de 1 à 5 : 10 carburant
    Passer de 2 à 5 : 6 carburant
    Passer de 0 à 5 : 15 carburant
    Passer de 4 à 5 : 1 carburant
    Passer de 2 à 5 : 6 carburant
    Passer de 7 à 5 : 3 carburant
    Passer de 1 à 5 : 10 carburant
    Passer de 2 à 5 : 6 carburant
    Passer de 14h à 5h45 carburant

Cela coûte un total de 168 carburant. C'est le nouveau résultat le moins cher possible ; l'ancienne position d'alignement (2) coûte maintenant 206 carburant à la place.

Déterminez la position horizontale sur laquelle les crabes peuvent s'aligner en utilisant le moins de carburant possible afin qu'ils puissent vous faire une échappatoire ! Combien de carburant doivent-ils dépenser pour s'aligner sur cette position ?