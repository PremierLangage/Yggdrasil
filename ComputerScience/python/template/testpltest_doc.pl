title=test du template pltest_doc 

text==
# Ceci est un fichier de test 
**Si l'on click sur valider le resultat doit être un success.**
Hop A égal à 2 et B à 3 
==

editor.code==
A=2
B=3
#
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

pltest0==
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

pltest1==
>>> C==C
True
>>> D==C
True
>>> E==C
True
==



extends= /ComputerScience/python/template/pltest.pl

#@ template.html









