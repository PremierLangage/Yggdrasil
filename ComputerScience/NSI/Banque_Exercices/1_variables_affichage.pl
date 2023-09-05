
# author emmanuel brunache

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/template/soluce.pl
@ /builder/before.py [builder.py]
title = Affichage

tag= print|variable|operation

before==#|python|
import random
variable = random.choice(['prenom', 'nom', 'surnom', 'blaze', 'sobriquet'])
nom = random.choice(['Jade', 'Louise', 'Emma', 'Alice', 'Ambre', 'Lina', 'Rose', 'Chloé'])
mplsoluce2="Test tiré aléatoirement \n{}\n{}\n".format(l,la)
==

text==  
Supposons que la variable {{variable}} soit initrialisée avec une valeur de type chaine de caractère.

Afficher le texte 'bonjour {{variable}}' où {{variable}} est bien entendu remplacé par sa valeur
==



soluce==
l=int(input())
la=int(input())
print("Le périmètre est",2*(l+la),"et la surface est",l*la,"!")
==
mplsoluce0==
Pour un rectangle de 2 sur 3
2 
3
==

mplsoluce1==
Un test beaucoup plus dur 
17575765776
3579877897987
==






