#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Couples (X,Y)

code==
li=int(input("nombre  de lignes"))
col=int(input("nombre de colonnes"))

==

taboo=while

text==  
Écrivez un script qui affiche tous les couples (x,y), x étant un entier positif compris entre 0 et li et y un entier positif 
compris entre 0 et col ; <br>
li et col sont deux entiers acquis au clavier. <br>
L’affichage doit se faire avec un espace entre chaque couple comme sur l’exemple suivant qui correspond à li = 3 et col = 5 :
(0,0) (0,1) (0,2) (0,3) (1,4) <br>
(1,0) (1,1) (1,2) (1,3) (1,4) <br>
(2,0) (2,1) (2,2) (2,3) (2,4) <br>


==

soluce==
p=int(input())
q=int(input())
for i in range(p):
    ligne=""
    for j in range(q):
        ligne += "("+str(i)+","+str(j)+") "
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












