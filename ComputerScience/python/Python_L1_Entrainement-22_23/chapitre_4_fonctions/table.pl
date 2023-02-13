
#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl
@ /builder/before.py [builder.py]
title = Afficher les "n" premiers multiples d'un entier "x"

code==


?? = ??(input("Saisissez un entier strictement positif : "))


print("\n de 0 fois",??,"à",??,"fois",n)
==

text==  

Ecrire une fonction `saisie_entier_str_positif` que force la saisie d'un entier strictement positif et le renvoie<br>
Ecrire une fonction `affiche_table` qui : <br> 
* prend en paramètre deux entiers strictement positif : <br>
    + un entier x  <br>
    + un entier n <br>
*imprime les n premiers multiples de x.

Pour finir écrivez un programme : <br>
* qui demande à l'utilisateur deux entiers strictement positifs, <br>
* et appelle la fonction `affiche_table` qui imprimera le résultat attendu.<br>

Vous vous aiderez du code déjà présent pour les saisies des valeurs. 
==
Xeditor.code==
def table(x,n):
    print("\nde 0 fois",n,"à",x,"fois",n)
    for i in range(n):
        print(i * x)
def  saisie_entier_str_positif():
    n=int(input("Saisissez un entier strictement positif : "))
    while(n<=0):
         n = int(input("Saisissez un entier strictement positif : "))
    return n

n = saisie_entier_str_positif()
x = saisie_entier_str_positif()

table(n,x)
==
soluce==#|python|
def table(x,n):
    print("\nde 0 fois",x,"à",n,"fois",x)
    for i in range(n):
        print(i * x)
def  saisie_entier_str_positif():
    n=int(input("Saisissez un entier strictement positif : "))
    while(n<=0):
         n = int(input("Saisissez un entier strictement positif : "))
    return n

n = saisie_entier_str_positif()
x = saisie_entier_str_positif()

table(n,x)
==
before==

==
mplsoluce0==
paire
2
4
==
mplsoluce1==
impaire 
3
9
==

mplsoluce2==
Grand 
10
40
==

mplsoluce3==
nul
0
1
10
==

mplsoluce4==
négatif
10
-2
5
==


















