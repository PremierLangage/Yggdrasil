extends = /ComputerScience/python/AP1-1920/templates/generic/generic.pl

title = Initialisation variable

text ==
Créer une variable `X` contenant la chaîne `toto`.
==

grader==#|python|
begin_test_group("Tests")
run(values={'X': 'toto'})
==