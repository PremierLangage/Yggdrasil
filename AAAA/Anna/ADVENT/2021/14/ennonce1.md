Les pressions incroyables à cette profondeur commencent à mettre à rude épreuve votre sous-marin. Le sous-marin dispose d'un équipement de polymérisation qui produirait des matériaux appropriés pour renforcer le sous-marin, et les grottes volcaniques actives à proximité devraient même avoir les éléments d'entrée nécessaires en quantités suffisantes.

Le manuel du sous-marin contient des instructions pour trouver la formule de polymère optimale ; plus précisément, il propose un modèle de polymère et une liste de règles d'insertion de paires (votre entrée de puzzle). Vous avez juste besoin de déterminer quel polymère résulterait après avoir répété le processus d'insertion de paires plusieurs fois.

Par exemple:

    NNCB

    CH -> B
    HH -> N
    CB -> H
    NH -> C
    HB -> C
    CH -> B
    HN -> C
    NN -> C
    BH -> H
    CN -> B
    NB -> B
    NE -> B
    BB -> N
    BC -> B
    CC -> N
    CN -> C

La première ligne est le modèle polymère - c'est le point de départ du processus.

La section suivante définit les règles d'insertion de paires. Une règle comme AB -> C signifie que lorsque les éléments A et B sont immédiatement adjacents, l'élément C doit être inséré entre eux. Ces insertions se produisent toutes simultanément.

Ainsi, en commençant par le modèle polymère NNCB, la première étape considère simultanément les trois paires :

    La première paire (NN) correspond à la règle NN -> C, donc l'élément C est inséré entre le premier N et le second N.
    La deuxième paire (NC) correspond à la règle NC -> B, donc l'élément B est inséré entre le N et le C.
    La troisième paire (CB) correspond à la règle CB -> H, donc l'élément H est inséré entre le C et le B.

Notez que ces paires se chevauchent : le deuxième élément d'une paire est le premier élément de la paire suivante. De plus, étant donné que toutes les paires sont considérées simultanément, les éléments insérés ne sont pas considérés comme faisant partie d'une paire jusqu'à l'étape suivante.

Après la première étape de ce processus, le polymère devient NCNBCHB.

Voici les résultats de quelques étapes utilisant les règles ci-dessus :

    Modèle : NNCB
    Après l'étape 1 : NCNBCHB
    Après l'étape 2 : NBCNBBBCBHCB
    Après l'étape 3 : NBBBCNCCNBBNBNBBCHBHHBCHB
    Après l'étape 4 : NBBNBNBBCCNBCNCCNBBNBBNBBBNBBNBBCBHCBHHNHCBBCBHCB

Ce polymère croît rapidement. Après l'étape 5, il a une longueur de 97 ; Après l'étape 10, il a une longueur de 3073. Après l'étape 10, B se produit 1749 fois, C se produit 298 fois, H se produit 161 fois et N se produit 865 fois ; prendre la quantité de l'élément le plus commun (B, 1749) et soustraire la quantité de l'élément le moins commun (H, 161) donne 1749 - 161 = 1588.

Appliquez 10 étapes d'insertion de paires au modèle polymère et trouvez les éléments les plus et les moins communs dans le résultat. Qu'obtenez-vous si vous prenez la quantité de l'élément le plus commun et soustrayez la quantité de l'élément le moins commun ?