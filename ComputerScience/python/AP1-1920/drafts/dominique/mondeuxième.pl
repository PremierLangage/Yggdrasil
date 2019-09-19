


author= Dominique's 

# Heritage d'un type d'exercice 
extends=../../templates/pltest.pl


title = Mon premier       

text==

ennoncé

ecrivez une fonction f 
qui retourne 3 

==

pltest==
>>> assert(f() == 3000) #

==


pltest1==
>>> f()
3
==

component.code == 
def f():
    print(3)
==
