
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
?? = ??(input("Saisisez deux entiers :"))
#

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
def carre(n):
    return(n*n)

def premiers_carres(k) :
    for i in range(k) :
        print (carre(i))

n = int(input("Saisisez un entier :"))
premiers_carres(n)
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






