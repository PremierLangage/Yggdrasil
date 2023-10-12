Le fond marin est de plus en plus raide. Peut-être que les clés du traîneau ont été transportées de cette façon ?

Un énorme banc de poissons-lanternes rougeoyants passe devant. Ils doivent apparaître rapidement pour atteindre un si grand nombre - peut-être de manière exponentielle ? Vous devez modéliser leur taux de croissance pour en être sûr.

Bien que vous ne sachiez rien sur cette espèce spécifique de poisson-lanterne, vous faites quelques suppositions sur ses attributs. Certes, chaque poisson-lanterne crée un nouveau poisson-lanterne une fois tous les 7 jours.

Cependant, ce processus n'est pas nécessairement synchronisé entre chaque poisson-lanterne - un poisson-lanterne peut avoir 2 jours avant de créer un autre poisson-lanterne, tandis qu'un autre peut en avoir 4. Ainsi, vous pouvez modéliser chaque poisson comme un nombre unique qui représente le nombre de jours jusqu'à ce qu'il en crée un autre. il crée un nouveau poisson-lanterne.

De plus, vous raisonnez, un nouveau poisson-lanterne aurait sûrement besoin d'un peu plus de temps avant d'être capable de produire plus de poisson-lanterne : deux jours de plus pour son premier cycle.

Donc, supposons que vous ayez un poisson-lanterne avec une valeur de minuterie interne de 3 :

    Après un jour, sa minuterie interne deviendrait 2.
    Après un autre jour, sa minuterie interne deviendrait 1.
    Après un autre jour, sa minuterie interne deviendrait 0.
    Après un autre jour, sa minuterie interne se réinitialisait à 6 et créait un nouveau poisson-lanterne avec une minuterie interne de 8.
    Après un autre jour, le premier poisson-lanterne aurait une minuterie interne de 5 et le deuxième poisson-lanterne aurait une minuterie interne de 7.
    Un poisson-lanterne qui crée un nouveau poisson réinitialise sa minuterie à 6, et non à 7 (car 0 est inclus comme valeur de minuterie valide). Le nouveau poisson-lanterne démarre avec une minuterie interne de 8 et ne commence pas à décompter avant le lendemain.

Réalisant ce que vous essayez de faire, le sous-marin produit automatiquement une liste des âges de plusieurs centaines de poissons lanternes à proximité (votre entrée de puzzle). Par exemple, supposons qu'on vous donne la liste suivante :

3,4,3,1,2
Cette liste signifie que le premier poisson a une minuterie interne de 3, le second poisson a une minuterie interne de 4, et ainsi de suite jusqu'au cinquième poisson, qui a une minuterie interne de 2. La simulation de ces poissons sur plusieurs jours se déroulerait comme suit :

    État initial : 3,4,3,1,2
    Après 1 jour : 2,3,2,0,1
    Après 2 jours : 1,2,1,6,0,8
    Après 3 jours : 0,1,0,5,6,7,8
    Après 4 jours : 6,0,6,4,5,6,7,8,8
    Après 5 jours : 5,6,5,3,4,5,6,7,7,8
    Après 6 jours : 4,5,4,2,3,4,5,6,6,7
    Après 7 jours : 3,4,3,1,2,3,4,5,5,6
    Après 8 jours : 2,3,2,0,1,2,3,4,4,5
    Après 9 jours : 1,2,1,6,0,1,2,3,3,4,8
    Après 10 jours : 0,1,0,5,6,0,1,2,2,3,7,8
    Après 11 jours : 6,0,6,4,5,6,0,1,1,2,6,7,8,8,8
    Après 12 jours : 5,6,5,3,4,5,6,0,0,1,5,6,7,7,7,8,8
    Après 13 jours : 4,5,4,2,3,4,5,6,6,0,4,5,6,6,6,7,7,8,8
    Après 14 jours : 3,4,3,1,2,3,4,5,5,6,3,4,5,5,5,6,6,7,7,8
    Après 15 jours : 2,3,2,0,1,2,3,4,4,5,2,3,4,4,4,5,5,6,6,7
    Après 16 jours : 1,2,1,6,0,1,2,3,3,4,1,2,3,3,3,4,4,5,5,6,8
    Après 17 jours : 0,1,0,5,6,0,1,2,2,3,0,1,2,2,2,3,3,4,4,5,7,8
    Après 18 jours : 6,0,6,4,5,6,0,1,1,2,6,0,1,1,1,2,2,3,3,4,6,7,8, 8,8,8

    
Chaque jour, un 0 devient un 6 et ajoute un nouveau 8 à la fin de la liste, tandis que chaque autre nombre diminue de 1 s'il était présent au début de la journée.

Dans cet exemple, après 18 jours, il y a un total de 26 poissons. Après 80 jours, il y aurait un total de 5934.

Trouvez un moyen de simuler le poisson-lanterne. Combien y aurait-il de poissons lanternes après 80 jours ?