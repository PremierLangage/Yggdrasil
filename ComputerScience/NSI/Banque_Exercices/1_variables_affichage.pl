
# author emmanuel brunache

# Heritage d'un type d'exercice 
extends = /ComputerScience/NSI/templatebackup/generic/generic.pl
@ /builder/before.py [builder.py]
title = Affichage

tag= print|variable|operation

before==#|python|
import random
variable = random.choice(['prenom', 'name', 'surnom', 'blaze', 'sobriquet'])
tabnom = ['Jade', 'Louise', 'Emma', 'Alice', 'Ambre', 'Lina', 'Rose', 'Chloé']
grader=f"""#|python|
# Ouvre un "groupe de tests" de titre donné
for nom in ['Jade', 'Louise', 'Emma', 'Alice', 'Ambre', 'Lina', 'Rose', 'Chloé']: 
    begin_test_group("Test " + nom)
    # Dans cet exemple on veut faire un test pour chaque permutation de (1, 2, 3)
    # On utilise ici un style "verbeux" avec plusieurs appels
    # set_title(f"Test")
    # Fixe les variables globales disponibles pour les prochaines exécution
    set_globals({variable}=nom)
    # Lance l'exécution du programme dans les conditions spécifiées
    run()
    # Vérifie la sortie standard obtenue
    assert_output('bonjour ' + nom + '\\n')
    # Vérifie que les variables globales n'ont pas changé
    assert_no_global_change()
    # Clôt le précédent groupe de tests
    end_test_group()
"""

==


text==  
Supposons que la variable `{{variable}}` soit initrialisée avec une valeur de type chaine de caractère.

Afficher le texte 'bonjour {{variable}}' où `{{variable}}` est bien entendu remplacé par sa valeur
==











