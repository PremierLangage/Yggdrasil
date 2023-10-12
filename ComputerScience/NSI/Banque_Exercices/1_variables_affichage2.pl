
# author emmanuel brunache

# Heritage d'un type d'exercice 
extends = /ComputerScience/NSI/templatebackup/generic/generic.pl
@ /builder/before.py [builder.py]
title = Affichage 2 variables

tag= print|variable|operation

before==#|python|
import random
variable = random.choice(['prenom', 'name', 'surnom', 'blaze', 'sobriquet'])
tabnom = ['Jade', 'Louise', 'Emma', 'Alice', 'Ambre', 'Lina', 'Rose', 'Chloé']
grader=f"""#|python|
for nom in ['Jade', 'Louise', 'Emma', 'Alice', 'Ambre', 'Lina', 'Rose', 'Chloé']:
    for age in [14, 15, 16, 17, 18]:
        begin_test_group("Test " + nom)
        set_globals({variable} = nom, age = age)
        run()
        assert_output("bonjour, je m'appelle " + nom + " et j'ai " + str(age) + ' ans\\n')
        # Vérifie que les variables globales n'ont pas changé
        assert_no_global_change()
        end_test_group()
"""

==


text==  
Supposons que la variable `{{variable}}` soit initrialisée avec une valeur de type chaine de caractère et que la variable `age` soit initialisée avec une valeur de type entière.

Afficher le texte 'bonjour, je m'appelle {{variable}} et j'ai age ans' où `{{variable}}` et `age` sont bien entendu remplacés par leur valeur.
==












