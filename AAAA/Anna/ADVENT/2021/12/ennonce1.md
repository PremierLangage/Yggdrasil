Avec les sous-systèmes souterrains de votre sous-marin qui subsistent de manière sous-optimale, la seule façon de sortir de cette grotte de sitôt est de trouver vous-même un chemin. Pas seulement un chemin - la seule façon de savoir si vous avez trouvé le meilleur chemin est de tous les trouver.

Heureusement, les capteurs fonctionnent toujours pour la plupart, et vous construisez donc une carte approximative des grottes restantes (votre entrée de puzzle). Par exemple:

commencer un
début-b
A-c
Un B
bd
Fin A
pliez
Ceci est une liste de la façon dont toutes les grottes sont connectées. Vous commencez dans la grotte nommée start et votre destination est la grotte nommée end. Une entrée comme b-d signifie que la grotte b est connectée à la grotte d - c'est-à-dire que vous pouvez vous déplacer entre elles.

Ainsi, le système de grottes ci-dessus ressemble à peu près à ceci :

        début
        / \
    c--A-----b--d
        \ /
        fin

Votre objectif est de trouver le nombre de chemins distincts qui commencent au début, se terminent à la fin et ne visitent pas les petites grottes plus d'une fois. Il existe deux types de grottes : les grandes grottes (écrites en majuscules, comme A) et les petites grottes (écrites en minuscules, comme b). Ce serait une perte de temps de visiter une petite grotte plus d'une fois, mais les grandes grottes sont suffisamment grandes pour qu'il vaille la peine de les visiter plusieurs fois. Ainsi, tous les chemins que vous trouvez doivent visiter de petites grottes au plus une fois et peuvent visiter de grandes grottes un certain nombre de fois.

Compte tenu de ces règles, il existe 10 chemins à travers cet exemple de système de grottes :

    début,A,b,A,c,A,fin
    début, A, b, A, fin
    début, A, b, fin
    début,A,c,A,b,A,fin
    début,A,c,A,b,fin
    début,A,c,A,fin
    début, A, fin
    début,b,A,c,A,fin
    début,b,A,fin
    début, b, fin

(Chaque ligne de la liste ci-dessus correspond à un chemin unique ; les grottes visitées par ce chemin sont répertoriées dans l'ordre dans lequel elles sont visitées et séparées par des virgules.)

Notez que dans ce système de grottes, la grotte d n'est jamais visitée par aucun chemin : pour ce faire, la grotte b devrait être visitée deux fois (une fois sur le chemin de la grotte d et une seconde fois en revenant de la grotte d), et depuis la grotte b est petit, ce n'est pas autorisé.

Voici un exemple un peu plus grand :

    dc-fin
    HN-début
    début-kj
    dec-début
    dc-HN
    LN-cc
    HN-fin
    kj-sa
    kj-HN
    kj-dc


Les 19 chemins qui le traversent sont les suivants :

    début,HN,dc,HN,fin
    début,HN,dc,HN,kj,HN,fin
    début,HN,dc,fin
    début, HN, dc, kj, HN, fin
    début, HN, fin
    début, HN, kj, HN, dc, HN, fin
    début, HN, kj, HN, dc, fin
    début,HN,kj,HN,fin
    début,HN,kj,dc,HN,fin
    début,HN,kj,dc,fin
    début,cc,HN,fin
    début,dc,HN,kj,HN,fin
    début, courant continu, fin
    début,dc,kj,HN,fin
    début,kj,HN,dc,HN,fin
    début,kj,HN,dc,fin
    début,kj,HN,fin
    début, kj, dc, HN, fin
    début, kj, dc, fin

Enfin, cet exemple encore plus grand comporte 226 chemins le traversant :

    fs-fin
    il-DX
    fs-il
    début-DX
    pj-DX
    fin-zg
    zg-sl
    zg-pj
    pj-il
    RW-il
    fs-DX
    pj-RW
    zg-RW
    début-pj
    il-WI
    zg-il
    pj-fs
    début-RW

Combien de chemins à travers ce système de grottes y a-t-il qui visitent de petites grottes au plus une fois ?