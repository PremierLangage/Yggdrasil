#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl
@ /builder/before.py [builder.py]
title = Permis de chasse

before==
import random
vache=random.randint (0,10)
poule=random.randint(0,35)
chien=random.randint (0,15)
amis=random.randint (0,5)

mplsoluce3="Test aléatoire\n"
mplsoluce3 += str(poule)+"\n"
mplsoluce3 += str(chien)+"\n"
mplsoluce3 += str(vache)+"\n"
mplsoluce3 += str(amis)+"\n"

after=before
==

text==  
Un permis de chasse à points remplace désormais le permis de chasse traditionnel.<br>
Chaque chasseur possède au départ un capital de 100 points. <br>
S’il tue une poule il perd 1 point, 5 points pour 1 chien, 10 points pour une vache et 30 points pour un ami. <br>
L'amende coûte 50 euros par points perdus. <br>
Si les points perdus sont supérieurs à 100, le permis est annulé.<br>
<br>
Écrire une fonction `amende` qui reçoit le nombre de victimes du chasseur et qui renvoie la somme due et le nombre de points perdus. <br>
Utilisez cette fonction dans un programme principal qui : <br>
* saisit le nombre de victimes et,<br>
* qui affiche la somme que le chasseur doit débourser au prorata des points perdus total, ainsi que,<br>
* le nombre de points restant (si la somme de points perdus est supérieure à 100, la fonction retourne 100).<br>
<br>
Écrire ensuite un programme principal qui :
* demande à l'utilisateur le nombre de victime
* retourne la somme à payer <br>
* le nombre de points restants ou l'annulation du permis<br>
<br>
Exemple : <br>

Combien de poules?1 <br>
Combien de chiens?2 <br>
Combien de vaches?10 <br>
Combien d'amis?20 <br>
<br>
Payer 12850 euros. <br>
Permis annulé <br>
<br>
Combien de poules?1 <br>
Combien de chiens?1 <br>
Combien de vaches?1 <br>
Combien d'amis?0 <br>
<br>
Payer 450 euros.<br>
Points perdus : 9
==

code==
#
#
#
poules=??(input("Combien de poules?"))
chiens=??(input("Combien de chiens?"))
vaches=??(input("Combien de vaches?"))
amis=??(input("Combien d'amis?"))
#

==

soluce==#|python|
def amende(p,c,v,a):
    points_perdus=p+5*c+10*v+30*a
    apayer=50*points_perdus
    if (points_perdus>=100):
        points_perdus = 100
    return (apayer,points_perdus)

#programme principal------------------
poules=int(input("Combien de poules?"))
chiens=int(input("Combien de chiens?"))
vaches=int(input("Combien de vaches?"))
amis=int(input("Combien d'amis?"))

payer,points=amende(poules,chiens,vaches,amis)

print("Payer",payer, "euros.")

if points==100:
    print("Permis annulé")
else:
    print("Points perdus :",points)
==

mplsoluce0==
Rien à payer
0
0
0
0
==Payer

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





