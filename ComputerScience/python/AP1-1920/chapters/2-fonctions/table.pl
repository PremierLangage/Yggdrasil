
#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl
@ /builder/before.py [builder.py]
title = Afficher les $%n%$ premiers multiples d'un entier $%x%$

code==
def saisie_entier_str_positif(...):
    ?? = ??(input('Saisissez un entier strictement positif : '))
    ...

def affiche_table(...):
    print('\n de 0 fois', ??, 'à', ??, 'fois', ??, ':')
    ...
==

text==  

1.  Ecrire une fonction `saisie_entier_str_positif` qui effectue la saisie d'un entier strictement positif et le renvoie<br>

2.  Ecrire une fonction `affiche_table` qui : <br> 
    * prend en paramètre deux entiers strictement positif `x`et `n` ; <br>
    * imprime les n premiers multiples de x.

3.  Pour finir, complétez le programme : <br>
    * qui demande à l'utilisateur deux entiers strictement positifs, <br>
    * appelle la fonction `affiche_table` qui imprimera le résultat attendu.<br>

    Vous vous aiderez du code déjà présent pour les saisies des valeurs. 

Un exemple complet d'exécution du programme est :<br><br>
`Saisissez un entier strictement positif : 2`<br>
`Saisissez un entier strictement positif : 4`<br>
`De 0 fois 2 à 3 fois 2 :`<br>
`0`<br>
`2`<br>
`4`<br>
`6`<br>
==
Xeditor.code==
def table(x,n):
    print('\n de 0 fois', x, 'à', n - 1, 'fois', x, ':')
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
def saisie_entier_str_positif():
    n=int(input("Saisissez un entier strictement positif : "))
    while(n<=0):
         n = int(input("Saisissez un entier strictement positif : "))
    return n

def table(x, n):
    print('\n de 0 fois', x, 'à', n - 1, 'fois', x, ':')
    for i in range(n):
        print(i * x)

x = saisie_entier_str_positif()
n = saisie_entier_str_positif()

table(x, n)
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






















