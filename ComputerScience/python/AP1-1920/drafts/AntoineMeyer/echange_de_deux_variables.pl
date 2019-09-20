# Ne fonctionne pas !

extends @/ComputerScience/python/AP1-1920/templates/plsoluce.pl
title = Échange de deux variables

text==
On suppose qu'il existe deux variables `a` et `b` de valeurs et de types 
quelconques précédemment fixées (vous n'avez donc pas à les initialiser
ni à les lire).

Écrire un programme dont l'exécution échange les valeurs de `a` et `b`, 
sans rien afficher.

**Attention**, *votre programe doit fonctionner quelles que soient les valeurs 
de `a` et `b` et leurs types (qui peuvent être différents).*
==

code=:CodeEditor

form==
{{ code|component }}
==

soluce==
a, b = b, a
==

plsoluce0==
Échange d'entiers | 
Échange entre un entier et une chaîne |
==
