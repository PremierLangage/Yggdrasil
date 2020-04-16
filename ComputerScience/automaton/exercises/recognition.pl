extends = ../templates/multichoice.pl

maxattempt = 3

generate== #|py|
from automaton import Automaton
from generator import Generator

# REMOVE COMMENT TO USE STRING NOTATION
viewer = '''
    #states
    S0
    S1
    S2
    #initials
    S0
    #accepting
    S2
    #alphabet
    a
    b
    c
    #transitions
    S0:a>S1
    S1:b>S2
    S2:a,b,c>S2
'''
#viewer = Automaton.rand(4, 3, 3)
==

title= Lecture d'automates

text==
Parmi les mots suivants, lesquels sont reconnus par cet automate?
==

