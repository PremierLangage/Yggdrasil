Vous vous occupez de vos propres affaires sur un navire en mer lorsque l'alarme à la mer se déclenche ! 
Vous vous précipitez pour voir si vous pouvez aider. Apparemment, l'un des elfes a trébuché et a accidentellement envoyé les clés du traîneau voler dans l'océan !

Avant que vous ne vous en rendiez compte, vous êtes à l'intérieur d'un sous-marin que les Elfes préparent pour des situations comme celle-ci. 
Il est couvert de lumières de Noël (parce que c'est bien sûr le cas), et il a même une antenne expérimentale qui devrait être capable de suivre les touches 
si vous pouvez augmenter suffisamment la puissance de son signal; il y a un petit compteur qui indique la force du signal de l'antenne en affichant 0 à 50 étoiles.

Votre instinct vous dit que pour sauver Noël, vous devrez obtenir les cinquante étoiles d'ici le 25 décembre.

Collectez des étoiles en résolvant des énigmes. Deux puzzles seront mis à disposition chaque jour dans le calendrier de l'Avent ; 
le deuxième puzzle est déverrouillé lorsque vous terminez le premier. Chaque puzzle accorde une étoile. Bonne chance!

Lorsque le sous-marin descend sous la surface de l'océan, il effectue automatiquement un balayage sonar du fond marin à proximité. 
Sur un petit écran, le rapport de balayage du sonar (votre saisie de puzzle) apparaît : chaque ligne est une mesure de la profondeur du fond marin à mesure que le balayage s'éloigne de plus en plus du sous-marin.

Par exemple, supposons que vous disposiez du rapport suivant :

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

Le premier ordre du jour est de déterminer à quelle vitesse la profondeur augmente, juste pour que vous sachiez à quoi vous avez affaire - 
vous ne savez jamais si les clés seront emportées dans des eaux plus profondes par un courant océanique ou un poisson ou quelque chose.

Pour ce faire, comptez le nombre de fois qu'une mesure de profondeur augmente par rapport à la mesure précédente. 
(Il n'y a pas de mesure avant la première mesure.) Dans l'exemple ci-dessus, les modifications sont les suivantes :

    199 (N/A - no previous measurement)
    200 (increased)
    208 (increased)
    210 (increased)
    200 (decreased)
    207 (increased)
    240 (increased)
    269 (increased)
    260 (decreased)
    263 (increased)

Dans cet exemple, 7 mesures sont supérieures à la mesure précédente.
Vous devez écrire une fonction Question1() qui lit le fichier "data" avec les données et qui retourne le nombre 
de mesures supérieures à la mesure précédente 