Vous avez presque atteint la sortie de la grotte, mais les murs se rapprochent. Votre sous-marin peut à peine tenir, cependant; le principal problème est que les murs de la grotte sont recouverts de chitons, et il vaut mieux ne pas en cogner aucun.

La caverne est grande, mais a un plafond très bas, limitant votre mouvement à deux dimensions. La forme de la caverne ressemble à un carré ; une analyse rapide de la densité de chiton produit une carte du niveau de risque dans toute la grotte (votre entrée de puzzle). Par exemple:

    1163751742
    1381373672
    2136511328
    3694931569
    7463417111
    1319128137
    1359912421
    3125421639
    1293138521
    2311944581

Vous commencez en haut à gauche, votre destination est en bas à droite et vous ne pouvez pas vous déplacer en diagonale. Le nombre à chaque position est son niveau de risque ; pour déterminer le risque total d'un chemin entier, additionnez les niveaux de risque de chaque position que vous entrez (c'est-à-dire, ne comptez pas le niveau de risque de votre position de départ à moins que vous ne l'entriez ; le laisser n'ajoute aucun risque à votre total).

Votre objectif est de trouver un chemin avec le risque total le plus faible. Dans cet exemple, un chemin avec le risque total le plus faible est mis en surbrillance ici :

    1163751742
    1381373672
    2136511328
    3694931569
    7463417111
    1319128137
    1359912421
    3125421639
    1293138521
    2311944581

Le risque total de ce chemin est de 40 (la position de départ n'est jamais entrée, donc son risque n'est pas compté).

Quel est le risque total le plus faible de tout chemin allant du coin supérieur gauche au coin inférieur droit ?