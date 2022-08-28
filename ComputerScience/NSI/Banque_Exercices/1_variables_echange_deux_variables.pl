# author = Antoine Meyer

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

title = Échange de deux variables

tag= variable|valeur|affectation

before==
from random import randint
a = randint(1,100)
b = a - randint(1,100)
pltest0 = """>>> a\n{}\n>>> b\n{}""".format(b, a)

==
# after = before
text==
On suppose qu'il existe deux variables `a` et `b` de valeurs et de types 
quelconques précédemment fixées (vous n'avez donc pas à les initialiser
ni à les lire).

Écrire un programme dont l'exécution échange les valeurs de `a` et `b`, 
sans rien afficher.

**Attention**, *votre programe doit fonctionner quelles que soient les valeurs 
de `a` et `b` et leurs types (qui peuvent être différents).*<br>
==










