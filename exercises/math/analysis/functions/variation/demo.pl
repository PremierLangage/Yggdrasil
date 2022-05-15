# Author: D. Doyen
# Tags: definition set, logarithm, linear inequality
# Déterminer l'ensemble de définition (maximal) d'une fonction
# 19/7/2021

extends = /model/math/multimathinput.pl

before ==
inputs = [MathInput() for _ in range(3)]
==

question ==
Déterminer l'ensemble de définition (maximal) de la fonction 

$$f : x \mapsto {{ f|latex }}.$$
==

inputblock ==

==
