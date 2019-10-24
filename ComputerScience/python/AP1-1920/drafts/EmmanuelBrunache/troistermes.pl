author= Emmanuel

# comment
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl

title = PGCD

text == 
Soit $%(u_n)%$ la suite définie par $%u_{n+1}=q*u_n%$ et $%u_{n_0}=b%$
Réaliser une fonction s'appelent "suite" qui prend 4 nombres $%q%$, $%n_0%$, $%b%$ et $%n%$ et qui retourne le n-ième terme de la suite

{{pltest}}
==

taboo=import

pltest==
>>> pgcd(2,4)
2
>>> pgcd(18,27)
9

==



