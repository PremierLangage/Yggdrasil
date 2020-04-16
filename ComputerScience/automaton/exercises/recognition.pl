extends = ../templates/base.pl

maxattempt = 3

generate== #|py|

from automaton import Automaton
from generator import Generator

viewer = Automaton.rand(4, 3, 3)
==

title= Lecture d'automates

text==
Parmi les mots suivants, lesquels sont reconnus par cet automate?
==

