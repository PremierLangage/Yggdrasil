extends = /ComputerScience/python/AP1-1920/templates/generic/generic.pl

title = Affichage

text ==
Afficher "Hello!" sur une première ligne et "Goodbye!" sur une seconde ligne.<br><br>
==

grader==#|python|
begin_test_group("Tests")
run(output="Hello!\nGoodbye!\n")
==
