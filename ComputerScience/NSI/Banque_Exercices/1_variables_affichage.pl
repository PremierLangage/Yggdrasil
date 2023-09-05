
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
grader=f"#|python|\n
# Ouvre un "groupe de tests" de titre donné\n
begin_test_group("Test")\n# Dans cet exemple on veut faire un test pour chaque permutation de (1, 2, 3)\n# On utilise ici un style "verbeux" avec plusieurs appels\nset_title(f"Test")\n# Fixe les variables globales disponibles pour les prochaines exécution\nset_globals({variable}={nom})\n# Lance l'exécution du programme dans les conditions spécifiées\nrun()\n# Vérifie la sortie standard obtenue\nassert_output('bonjour ' + {nom} + '\n')\n# Vérifie que les variables globales n'ont pas changé\nassert_no_global_change()\n# Clôt le précédent groupe de tests\nend_test_group()"

==



text==  
Supposons que la variable {{variable}} soit initrialisée avec une valeur de type chaine de caractère.

Afficher le texte 'bonjour {{variable}}' où {{variable}} est bien entendu remplacé par sa valeur
==











