** BRAVO VOUS ETES A LA DEUXIEME PARTIE**


--- Deuxième Partie ---

Bien qu'il semble que vous ayez correctement validé les mots de passe, ils ne semblent pas correspondre à ce que le système officiel d'authentification d'entreprise Toboggan attend.

Le commerçant se rend soudain compte qu'il vient d'expliquer accidentellement les règles de la politique de mot de passe de son ancien travail au lieu de location de traîneaux en bas de la rue ! La politique officielle de l'entreprise sur la luge fonctionne en fait un peu différemment.

Chaque stratégie décrit en fait deux positions dans le mot de passe, où 1 signifie le premier caractère, 2 signifie le deuxième caractère, etc. (Attention ; les politiques d'entreprise de Toboggan n'ont pas de concept d'"indice zéro" !) Exactement l'une de ces positions doit contenir la lettre donnée. 
Les autres occurrences de la lettre ne sont pas pertinentes aux fins de l'application de la politique.

Étant donné la même liste d'exemples ci-dessus :

    1-3 a : abcde est valide : la position 1 contient a et la position 3 non.
    1-3 b : cdefg est invalide : ni la position 1 ni la position 3 ne contiennent b.
    2-9 c : ccccccccc n'est pas valide : les positions 2 et 9 contiennent c.

Vous devez écrire une fonction Question2() qui lit le fichier "data" avec les données et qui retourne le nombre de mots de passe sont valides selon la nouvelle interprétation des politiques ?