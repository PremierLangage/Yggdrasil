#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Permis de chasse

code==
#
#
#
n = ??(input("Saisie : "))
#

==

text==  
Un permis de chasse à points remplace désormais le permis de chasse traditionnel.
Chaque chasseur possède au départ un capital de 100 points. 
S’il tue une poule il perd 1 point, 3 points pour 1 chien, 5 points pour une vache et 10 points pour un ami. 
Le permis coûte 200 euros. Écrire une fonction amende qui reçoit le nombre de victimes du chasseur et qui renvoie la somme due. 
Utilisez cette fonction dans un programme principal qui saisit le nombre de victimes et qui affiche la somme que le chasseur doit débourser.
==

soluce==#|python|
def permisSup(p,c,v,a):
	points_perdus=p+3*c+5*v+10*a
	nbre_permis=points_perdus/100.0
	return 200*nbre_permis

#programme principal-----------------------------------------------
poules=int(input("Combiendepoules?"))
chiens=int(input("Combiendechiens?"))
vaches=int(input("Combiendevaches?"))
amis=int(input("Combiend'amis?"))

payer=permisSup(poules,chiens,vaches,amis)
print("\nApayer:",end="")
if payer==0:
    print("rien a payer")
else:
    print(payer,"euros")
==

mplsoluce0==
False
2
==
mplsoluce1==
False
3
==

mplsoluce2==
True
10
==


