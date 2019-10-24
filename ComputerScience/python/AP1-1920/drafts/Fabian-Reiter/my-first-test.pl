author = Fabian Reiter

#Héritage d'un type d'exercice
extends = ../../templates/pltest.pl

title = Some title

text = Écrire une fonction `filtre(d, e)` qui prend un dictionnaire `d` et un élément `e`, et qui retourne une **copie** de `dict` sans l'élément `e`.

pltest==
>>> my_dict = {1, 2, 3, 4, 5}
>>> new_dict = filtre(my_dict, 3)
>>> my_dict == {1, 2, 3, 4, 5}
True
>>> new_dict == {1, 2, 4, 5}
True
==


