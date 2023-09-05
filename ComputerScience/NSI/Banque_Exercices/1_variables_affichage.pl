
# author emmanuel brunache

# Heritage d'un type d'exercice 
# extends=/ComputerScience/python/template/soluce.pl
extends = /template/python.pl
@ /builder/before.py [builder.py]
title = Affichage

tag= print|variable|operation

before==#|python|
import random
variable = random.choice(['prenom', 'name', 'surnom', 'blaze', 'sobriquet'])
nom = random.choice(['Jade', 'Louise', 'Emma', 'Alice', 'Ambre', 'Lina', 'Rose', 'Chloé'])
mplsoluce0="Test tiré aléatoirement \n{}\n".format(nom)
soluce=f'{variable}="{nom}"\nprint("bonjour", {variable})'
stdout_tests=f"""bonjour {nom}"""
# code=f'{variable}="{nom}" # NE PAS EFFACER CETTE LIGNE\n'
with open("student.py","w") as sf:
        sf.write(f'{variable}="{nom}"')
==

text==  
Supposons que la variable {{variable}} soit initrialisée avec une valeur de type chaine de caractère.

Afficher le texte 'bonjour {{variable}}' où {{variable}} est bien entendu remplacé par sa valeur
==











