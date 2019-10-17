


extends= /ComputerScience/python/AP1-1920/templates/pltest.pl


title= Des lapins ... 

text==
Un couple de lapins arrive sur l'ile de Quang Binh le 1er septembre. Ce couple a sa première portée à deux mois, puis une portée tous les mois.
Chaque portée est un couple de lapins. Tous les couples ainsi obtenus se reproduisent
de la même manière.<br>
1er septembre : 1 couple de jeunes lapins<br>
1er octobre : 1 couple de  lapins d’un mois<br>
1er novembre : 1 couple de vieux et 1 couple de petits<br>
1er décembre : 1 couple de jeunes lapins ,1 couple de  lapins d’un mois et 1 couple de vieux<br>
1er janvier : 2 couple de jeunes lapins ,1 couple de  lapins d’un mois et 2 couples de vieux <br>
,soit 10 lapins.<br>

Ecrire une fontion `lapin(mois)` qui reçoit un entier décrivant le nombre de mois
 écoulé et renvoie le nombre de couples.(*On distinguera le nombre de couples de nouveaux lapins, le nombre
de couples de lapins ayant un mois, et le nombre de couples de lapins
ayant 2 mois ou plus*).<br>

On fera les doctest suivants :

    >>> lapin(4)
    4
    >>> lapin(43)
    12322413
    >>> 

plus d'autres ....


==


pltest1==
>>> lapin(4) == 4 # verification de l'existance de la fonction lapin 
True
>>> lapin(4)
4
==

pltest2==
>>>  lapin(43) # Beaucoup de lapins
12322413
==

