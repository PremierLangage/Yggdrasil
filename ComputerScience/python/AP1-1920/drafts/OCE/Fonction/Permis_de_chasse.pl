#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Permis de chasse

code==
#
#
#
poules=??(input("Combiendepoules?"))
chiens=??(input("Combiendechiens?"))
vaches=??(input("Combiendevaches?"))
amis=??(input("Combiend'amis?"))
#

==

text==  
Un permis de chasse à points remplace désormais le permis de chasse traditionnel.<br>
Chaque chasseur possède au départ un capital de 100 points. <br>
S’il tue une poule il perd 1 point, 5 points pour 1 chien, 10 points pour une vache et 30 points pour un ami. <br>
L'amende coûte 50 euros par points perdus. <br>
<br>
Écrire une fonction "amende" qui reçoit le nombre de victimes du chasseur et qui renvoie la somme due et le nombre de points perdus. <br>
Utilisez cette fonction dans un programme principal qui : <br>
* saisit le nombre de victimes et,<br>
* qui affiche la somme que le chasseur doit débourser ainsi que,<br>
* le nombre de points restant (si la somme de points perdus est supérieure à 100, la fonction retourne 100).<br>
Écrire ensuite un programme principal qui :

Exemple : <br>

==

soluce==#|python|
def amende(p,c,v,a):
    points_perdus=p+3*c+5*v+10*a
    if (points_perdus>=100):
        points_perdus = 100
    return (50*points_perdus,points_perdus)

#programme principal------------------
poules=int(input("Combien de poules?"))
chiens=int(input("Combien de chiens?"))
vaches=int(input("Combien de vaches?"))
amis=int(input("Combien d'amis?"))

payer,points=amende(poules,chiens,vaches,amis)

print("Payer ",payer, " euros.")

if points==100:
    print("Permis annulé")
else:
    print("Points perdus : ",points)
==

mplsoluce0==
Rien à payer
0
0
0
0
==

mplsoluce1==
2 amis
0
0
0
2
==

mplsoluce2==
1 vache et un 1 chien
0
1
1
0
==


