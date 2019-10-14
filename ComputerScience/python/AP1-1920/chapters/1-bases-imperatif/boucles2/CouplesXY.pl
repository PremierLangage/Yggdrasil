#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Couples (X,Y)

code==
p=int(input())
q=int(input())

==

taboo=while

text==  
Écrivez un script qui affiche tous les couples ( x , y ), x étant un entier positif compris entre 1 et p et y un entier positif 
compris entre 1 et q ; <br>
p et q sont deux entiers acquis au clavier. <br>
L’affichage doit se faire avec un espace entre chaque couple comme sur l’exemple suivant qui correspond à p = 3 et q = 5 :
(1,1) (1,2) (1,3) (1,4) (1,5) <br>
(2,1) (2,2) (2,3) (2,4) (2,5) <br>
(3,1) (3,2) (3,3) (3,4) (3,5) <br>

==

soluce==
p=int(input())
q=int(input())
for i in range(p):
    ligne=""
    for j in range(q):
        ligne += "("+str(i+1)+","+str(j+1)+") "
    print(ligne)
==

mplsoluce0==
Négatif 
-1
-2
==
mplsoluce1==
Facile 
1
2
==
mplsoluce2==
Grand 
30
46
==
mplsoluce5==
nul
0
0
==











