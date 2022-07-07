
Le sous-marin a fait des craquements étranges, vous lui demandez donc de produire un rapport de diagnostic au cas où.

Le rapport de diagnostic (votre entrée de puzzle) se compose d'une liste de nombres binaires qui, lorsqu'ils sont décodés 
correctement, peuvent vous dire beaucoup de choses utiles sur les conditions du sous-marin. Le premier paramètre à vérifier est la consommation électrique.

Vous devez utiliser les nombres binaires du rapport de diagnostic pour générer deux nouveaux nombres binaires (appelés taux gamma et taux epsilon). 
La consommation d'énergie peut alors être trouvée en multipliant le taux gamma par le taux epsilon.

Chaque bit du taux gamma peut être déterminé en trouvant le bit le plus commun dans la position correspondante de tous les nombres dans le rapport de diagnostic. 
Par exemple, étant donné le rapport de diagnostic suivant :

    00100
    11110
    10110
    10111
    10101
    01111
    00111
    11100
    10000
    11001
    00010
    01010

En considérant uniquement le premier bit de chaque nombre, il y a cinq bits 0 et sept bits 1. 
Puisque le bit le plus courant est 1, le premier bit du taux gamma est 1.

Le deuxième bit le plus courant des nombres dans le rapport de diagnostic est 0, donc le deuxième bit du taux gamma est 0.

La valeur la plus courante des troisième, quatrième et cinquième bits est 1, 1 et 0, respectivement, et donc les trois 
derniers bits du taux gamma sont 110.

Ainsi, le taux gamma est le nombre binaire 10110, soit 22 en décimal.

Le taux d'epsilon est calculé de la même manière ; plutôt que d'utiliser le bit le plus commun, le bit le moins commun 
de chaque position est utilisé. Ainsi, le taux d'epsilon est 01001, soit 9 en décimal. La multiplication du taux gamma (22) par le taux epsilon (9) produit la consommation d'énergie, 198.

Utilisez les nombres binaires de votre rapport de diagnostic pour calculer le taux gamma et le taux epsilon, 
puis multipliez-les ensemble. Quelle est la consommation électrique du sous-marin ? (Assurez-vous de représenter votre réponse en décimal et non en binaire.)