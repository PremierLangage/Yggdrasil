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
S’il tue une poule il perd 1 point, 3 points pour 1 chien, 5 points pour une vache et 10 points pour un ami. <br>
L'amende coûte 20 euros par points perdus. <br>
Écrire une fonction "amende" qui reçoit le nombre de victimes du chasseur et qui renvoie la somme due. <br>
Utilisez cette fonction dans un programme principal qui saisit le nombre de victimes et qui affiche la somme que le chasseur doit débourser <br>
ainsi que le nombre de points restant.
==

soluce==#|python|
def amende(p,c,v,a):
	points_perdus=p+3*c+5*v+10*a
	nbre_permis=points_perdus/100.0
	return 200*nbre_permis

#programme principal-----------------------------------------------
poules=int(input("Combiendepoules?"))
chiens=int(input("Combiendechiens?"))
vaches=int(input("Combiendevaches?"))
amis=int(input("Combiend'amis?"))

payer=amende(poules,chiens,vaches,amis)
if payer==0:
    print("rien a payer")
else:
    print("payer :",payer,"euros")
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


