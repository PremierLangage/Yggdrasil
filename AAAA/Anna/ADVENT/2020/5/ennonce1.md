Vous montez à bord de votre avion pour découvrir un nouveau problème : vous avez fait tomber votre carte d'embarquement ! Vous ne savez pas quel siège est le vôtre et tous les agents de bord sont occupés par le flot de personnes qui ont soudainement franchi le contrôle des passeports.

Vous écrivez un programme rapide pour utiliser l'appareil photo de votre téléphone pour scanner toutes les cartes d'embarquement à proximité (votre entrée de puzzle); peut-être pourrez-vous trouver votre place grâce au processus d'élimination.

Au lieu de zones ou de groupes, cette compagnie aérienne utilise un partitionnement binaire de l'espace pour accueillir les passagers. Un siège peut être spécifié comme FBFBBFFRLR, où F signifie "avant", B signifie "arrière", L signifie "gauche" et R signifie "droite".

Les 7 premiers caractères seront soit F soit B ; ceux-ci spécifient exactement l'une des 128 lignes du plan (numérotées de 0 à 127). Chaque lettre vous indique dans quelle moitié de région se trouve le siège donné. Commencez par la liste complète des lignes ; la première lettre indique si le siège est à l'avant (0 à 63) ou à l'arrière (64 à 127). La lettre suivante indique dans quelle moitié de cette région se trouve le siège, et ainsi de suite jusqu'à ce qu'il vous reste exactement une rangée.

Par exemple, considérez uniquement les sept premiers caractères de FBFBBFFRLR :

Commencez par considérer toute la plage, les lignes 0 à 127.
F signifie prendre la moitié inférieure, en gardant les rangées 0 à 63.
B signifie prendre la moitié supérieure, en gardant les rangées 32 à 63.
F signifie prendre la moitié inférieure, en gardant les rangées 32 à 47.
B signifie prendre la moitié supérieure, en gardant les rangées 40 à 47.
B conserve les rangées 44 à 47.
F conserve les rangées 44 à 45.
Le F final garde le plus bas des deux, rang 44.
Les trois derniers caractères seront soit L soit R ; ceux-ci spécifient exactement l'une des 8 colonnes de sièges de l'avion (numérotées de 0 à 7). Le même processus que ci-dessus se poursuit à nouveau, cette fois avec seulement trois étapes. L signifie conserver la moitié inférieure, tandis que R signifie conserver la moitié supérieure.

Par exemple, considérez uniquement les 3 derniers caractères de FBFBBFFRLR :

Commencez par considérer toute la plage, les colonnes 0 à 7.
R signifie prendre la moitié supérieure, en gardant les colonnes 4 à 7.
L signifie prendre la moitié inférieure, en gardant les colonnes 4 à 5.
Le R final conserve le supérieur des deux, colonne 5.

Ainsi, le décodage de FBFBBFFRLR révèle qu'il s'agit du siège à la ligne 44, colonne 5.

Chaque siège a également un ID de siège unique : multipliez la ligne par 8, puis ajoutez la colonne. Dans cet exemple, le siège a ID 44 * 8 + 5 = 357.

Voici quelques autres cartes d'embarquement :

BFFFBBFRRR : ligne 70, colonne 7, ID de siège 567.
FFFBBBFRRR : ligne 14, colonne 7, ID de siège 119.
BBFFBBFRLL : ligne 102, colonne 4, ID de siège 820.

Pour vérifier votre santé mentale, parcourez votre liste de cartes d'embarquement. Quel est l'ID de siège le plus élevé sur une carte d'embarquement ?