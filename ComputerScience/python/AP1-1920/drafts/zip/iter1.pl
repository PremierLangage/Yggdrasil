
# author zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = nombres divisibles


text==  

Ecrire un programme qui lit 12 entiers et affiche combien sont divisibles par 7
==
code==



print("Il y a",nb","multiples de 7")
==
soluce==
nb=0
for i in range(12):
    l=int(input())
    if l%7==0:
       nb+=1
print("Il y a",n,"multiples de 7")
==
mplsoluce0==
essai1
2 
3
5
14
77
0
81 
7749
15 
98
11
35
==
