#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Histoire de trains

text==  

Je suis ligoté sur les rails en gare d’Arras.<br> 
Écrire un programme qui affiche un tableau me permettant de connaître l’heure à laquelle je serai déchiqueté par le train parti de la gare du Nord
à 9h (il y a 170 km entre la gare du Nord et Arras).<br>t
–Écrire une fonction "temps_mis" qui reçoit la vitesse du train et la distance et qui renvoie le temps mis pour parcourir cette distance;<br>
–Écrire le programme principal qui affiche le tableau demandé.<br>
<br>
indice : pour imprimer le tableau, on vous donne la phrase à utiliser : <br>
print("A {}km/h,je me fais dechiqueter à {}h{:.2f}min.".format(v,heure,minute))
==

code==
#
#
#
print("A {}km/h,je me fais dechiqueter à {}h{:.2f}min.".format(v,heure,minute))
#

==

soluce==#|python|
def tchacatchac(km,v):
    """retourne le temps en heure mn pour parcourir km à la vitesse v."""
    heure =int(170/v)
    minute= (60 * 170 //v) % 60
    return heure,minute
v=100
h,m=tchacatchac(170,v)
print("A",v,"km/h,je me fais dechiqueter à ",9 + h,"h",m,"mn")  

#programme principal


==

mplsoluce0==
vitesse de 100
100
==
mplsoluce1==
vitesse de 150
150
==

mplsoluce2==
vitesse de 300
300
==

