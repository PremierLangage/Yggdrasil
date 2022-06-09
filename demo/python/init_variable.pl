extends = /model/progpython.pl

title = Initialisation variable

text ==
Créer une variable `X` contenant la chaîne `toto`.
==

grader==#|python|
run(values={'X': 'toto'})
==