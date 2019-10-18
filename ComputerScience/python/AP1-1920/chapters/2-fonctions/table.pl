
#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Afficher les "n" premiers multiples d'un entier "x"

code==

#
?? = ??(input("Saisisez un entier : "))
#
#
#


?? = ??(input("Saisissez un entier strictement positif : "))
==

text==  

Ecrire une fonction **saisie_entier_str_positif** que force la saisie d'un entire strictement positif et le renvoie<br>
Ecrire une fonction **table** qui : <br> 
* prend en paramètre deux entiers : <br>
   + un entier n <br>
   + un entier strictement positif k <br>
* imprime les "k" premiers multiples de "n"

Pour finir écrivez un code : <br>
* qui demande à l'utilisateur deux entiers (dont un strictement positif), <br>
* appelle la fonction **table** qui imprimera le résultat attendu.<br>

Vous vous aiderez du code déjà présent pour les saisies des valeurs. 
==

soluce==#|python|
def table(n,x):
    for i in range(n):
        print(i * x, end =' ')
def  saisie_entier_str_positif():
    n=int(input("Saisissez un entier strictement positif : "))
    while(n<=0):
         n = int(input("Saisissez un entier strictement positif : "))
    return n

n = int(input("Saisisez un entier n : "))
k = saisie_entier_str_positif()

table(n,k)
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
10
==

mplsoluce4==
négatif
10
-2
5
==











