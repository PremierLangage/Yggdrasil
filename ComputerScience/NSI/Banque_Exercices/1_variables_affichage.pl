
# author emmanuel brunache

# Heritage d'un type d'exercice 
extends = /ComputerScience/python/AP1-1920/templates/generic/generic.pl
@ /builder/before.py [builder.py]
title = Affichage

tag= print|variable|operation

before==#|python|
import random
variable = random.choice(['prenom', 'name', 'surnom', 'blaze', 'sobriquet'])
nom = random.choice(['Jade', 'Louise', 'Emma', 'Alice', 'Ambre', 'Lina', 'Rose', 'Chloé'])
mplsoluce0="Test tiré aléatoirement \n{}\n".format(nom)
soluce=f'{variable}="{nom}"\nprint("bonjour", {variable})'
# code=f'{variable}="{nom}" # NE PAS EFFACER CETTE LIGNE\n'
grader=f"""#|python|
# Ouvre un "groupe de tests" de titre donné
begin_test_group("Test")
# Dans cet exemple on veut faire un test pour chaque permutation de (1, 2, 3)
# On utilise ici un style "verbeux" avec plusieurs appels
set_title(f"Test")
# Fixe les variables globales disponibles pour les prochaines exécution

"""

==



text==  
Supposons que la variable {{variable}} soit initrialisée avec une valeur de type chaine de caractère.

Afficher le texte 'bonjour {{variable}}' où {{variable}} est bien entendu remplacé par sa valeur
==











