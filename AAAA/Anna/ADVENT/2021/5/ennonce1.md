Vous tombez sur un champ d'évents hydrothermaux au fond de l'océan ! Ces évents produisent constamment de gros nuages ​​opaques, il serait donc préférable de les éviter si possible.

Ils ont tendance à se former en lignes; le sous-marin produit utilement une liste des lignes d'évents à proximité (votre entrée de puzzle) que vous pouvez examiner. Par exemple:

    0,9 -> 5,9
    8,0 -> 0,8
    9,4 -> 3,4
    2,2 -> 2,1
    7,0 -> 7,4
    6,4 -> 2,0
    0,9 -> 2,9
    3,4 -> 1,4
    0,0 -> 8,8
    5,5 -> 8,2


Chaque ligne d'évents est donnée sous la forme d'un segment de ligne au format x1,y1 -> x2,y2 où x1,y1 sont les coordonnées d'une extrémité du segment de ligne et x2,y2 sont les coordonnées de l'autre extrémité. Ces segments de ligne incluent les points aux deux extrémités. Autrement dit:

Une entrée comme 1,1 -> 1,3 couvre les points 1,1, 1,2 et 1,3.
Une entrée comme 9,7 -> 7,7 couvre les points 9,7, 8,7 et 7,7.
Pour l'instant, ne considérez que les lignes horizontales et verticales : les lignes où x1 = x2 ou y1 = y2.

Ainsi, les lignes horizontales et verticales de la liste ci-dessus produiraient le diagramme suivant :

    .......1..
    ..1....1..
    ..1....1..
    .......1..
    .112111211
    ..........
    ..........
    ..........
    ..........
    222111....

    
Dans ce diagramme, le coin supérieur gauche est 0,0 et le coin inférieur droit est 9,9. Chaque position est indiquée par le nombre de lignes qui couvrent ce point ou . si aucune ligne ne couvre ce point. La paire de 1 en haut à gauche, par exemple, vient de 2,2 -> 2,1 ; la rangée tout en bas est formée par les lignes qui se chevauchent 0,9 -> 5,9 et 0,9 -> 2,9.

Pour éviter les zones les plus dangereuses, vous devez déterminer le nombre de points où au moins deux lignes se chevauchent. Dans l'exemple ci-dessus, c'est n'importe où dans le diagramme avec un 2 ou plus - un total de 5 points.

Ne considérez que les lignes horizontales et verticales. En combien de points au moins deux droites se chevauchent-elles ?