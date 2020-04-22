
extends = editor.pl


title= 
text= 

generate==
viewer = Automaton.viewer('''
    #states
    S0
    S1
    S2
    #initials
    S0
    S1
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
''')
==


