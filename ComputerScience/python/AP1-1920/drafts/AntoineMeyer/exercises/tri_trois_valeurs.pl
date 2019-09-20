# author = Antoine Meyer
extends = ../templates/ap1_template.pl
title = Tri de trois valeurs

text==
On suppose qu'il existe trois variables `a`, `b` et `c` de valeurs quelconques et  
comparables entre elles (vous n'avez donc pas à les initialiser ni à les lire).

Écrire un programme dont l'exécution affiche (à l'aide de la fonction `print`) 
les valeurs de `a` `b` et `c` dans l'ordre croissant, séparées par des espaces, 
suivies d'un retour à la ligne.

Par exemple, si on suppose qu'au début du programme `a` vaut `5`, `b` vaut `1` 
et `c` vaut 3, le programme devra afficher *précisément* la chaîne `'1 3 5\n'`.



**Attention :**
- Le programe doit fonctionner quelles que soient les valeurs 
  de `a`, `b` et `c` du moment qu'elles sont comparables ;
- Le programme ne doit pas modifier les valeurs des variables `a`, `b` et `c`, 
  ni créer de nouvelles variables.
<br><br>
==

grader==
begin_test_group("Échange de deux entiers")
set_globals(a=1, b=2)
run()
assert_variable_values(a=2, b=1)
end_test_group()

begin_test_group("Échange d'un entier et d'une chaîne")
set_globals(a=1, b="ça marche")
run()
assert_variable_values(a="ça marche", b=1)
end_test_group()
==

