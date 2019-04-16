title=test de pltest_doc 

text==

Hop A égal à 2 et B à 3 

==




code==
A=2
B=3
==

# les tests avec un seul # ne sont pas visible par l'étudiant
# sauf si il produisent une erreur  
pltest==
>>> A == A #
True
>>> B == B #
True
>>> A # A egal deux
2
>>> B
3
==

xpltest0==
>>> 1==12
True
>>> 1==1
True
>>> 1==1
True
>>> 1==1
True
>>> 1==1
True
==

Xpltest1==
>>> C==C
True
>>> D==C
True
>>> E==C
True
==



extends=pltest.pl

@ template.html







