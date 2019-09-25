# author = Antoine Meyer
extends = ../templates/generic/generic.pl

title = Test de l'exception StopGrader

text==
Exercice vide. Une exception d'arrêt est lancée immédiatement.
==

grader==
raise test.StopGrader
==

