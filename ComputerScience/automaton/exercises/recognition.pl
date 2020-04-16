extends = ../templates/multichoice.pl

maxattempt = 3

generate== #|py|
from automaton import Automaton
from generator import Generator

# YOU CAN USE ANY OF THE NOTATIONS ACCEPTED BY THE AUTOMATON CLASS HERE
# object notation, string notation...
viewer = Automaton.rand(4, 3, 3)
==

title= Lecture d'automates

text==
Parmi les mots suivants, lesquels sont reconnus par cet automate?
==

