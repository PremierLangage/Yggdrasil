
#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Afficher les "n" premiers multiples d'un entier "x"

code==
#
#
#
#
#
#
#
?? = ??(input("Saisisez un entier n :"))
#
?? = ??(input("Saisissez un entier k strictement positif : "))
==

text==  

Programmer une fonction "table" qui : <br 
* prend en paramètre deux entiers : <br>
   + un entier n <br>
   + un entier strictement positif k <br>
* imprime les "k" premiers multiple de "n"

Pour finir écrivez un code : <br>
* qui demande à l'utilisateur deux entiers (dont un strictement positif), <br>
* appel la fonction "table" qui imprimera le résultat attendu.<br>

Vous vous aiderez du code déjà présent pour les saisies des valeurs. 
==

soluce==#|python|
def table(n,x):
    for i in range(n):
        print(i * x, end =' ')

n = int(input("Saisisez un entier n :"))
k = int(input("Saisissez un entier k strictement positif : "))
while(k<=0):
    k = int(input("Saisissez un entier strictement positif : "))
table(n,k)
==

mplsoluce0==
paire
2
==
mplsoluce1==
impaire 
3
==

mplsoluce2==
Grand 
10
==

mplsoluce3==
nul
0
==






