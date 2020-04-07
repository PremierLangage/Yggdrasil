
extends=AMC-auto.pl

mk_auto == #|python|
viewer.automaton+="""
#states
s4
s5
s0:a>s2"""
==

#le fichier autretomate aura comme nom tomate.py
# il sera pris à place de tomate.py
@autretomate.py [tomate.py]

questions==
** Cet automate est-il
+ deterministe
+ complet
+ accessible
- co-accessible
- rouge
+ barbu

==
