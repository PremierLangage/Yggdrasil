
# author zip
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Reproduction
text==
Un couple de lapins arrive sur l'ile de Quang Binh le 1er septembre. Ce couple a sa première portée à deux mois, puis une portée tous les mois.
Chaque portée est un couple de lapins. Tous les couples ainsi obtenus se reproduisent
de la même manière.<br>
1er septembre : 1 couple de jeunes lapins<br>
1er octobre : 1 couple de  lapins d’un mois<br>
1er novembre : 1 couple de vieux et 1 couple de petits<br>
1er décembre : 1 couple de jeunes lapins ,1 couple de  lapins d’un mois et 1 couple de vieux<br>
1er janvier : 2 couple de jeunes lapins ,1 couple de  lapins d’un mois et 2 couples de vieux <br>
,soit 10 lapins.<br>

Ecrire une fontion `lapin(mois)` qui reçoit un entier décrivant le nombre de mois
 écoulé et renvoie le nombre de couples.(*On distinguera le nombre de couples de nouveaux lapins, le nombre
de couples de lapins ayant un mois, et le nombre de couples de lapins
ayant 2 mois ou plus*).<br>
* Utiliser cette fonction pour écrire un programme qui :<br>
1) lit un nombre de mois et affiche le nombre de lapins quand ce nombre de mois est écoulé
<br>
2) lit un nombre de lapins et détermine au bout de combien de mois cette population est atteinte.
  


Exemples
 
Entrez un nombre de mois : 5 <br>
en 5 mois 12 lapins<br>
Entrez une population : 45 <br>
en 9 mois 56 lapins<br>



==
before==
import random

mplsoluce2="Test aléatoire\n"
n=random.randint(4,7)
n*=100000
mplsoluce2 += str(n)+"\n"
mplsoluce2 +="hi"
==
code==

??=int(input("nombre de mois : ")


print(" en",??,"mois",??,"lapins")


??=int(input("population : "))


print(" en",??,"mois",??,"lapins")


==
soluce==
def lapin(mois):
    vieux=1
    ado1=0
    ado2=0
    jeune=0
    
    if mois>1:
        for i in range(1,mois):
            vieux+=ado2
            ado2=ado1
            ado1=jeune
            jeune=vieux
    #return jeune,ado1,ado2,vieux
    return jeune+ado1+ado2+vieux
mois=int(input("nombre de mois : "))
print(" en",mois,"mois",2*lapin(i),"lapins")
nb=int(input("population : "))

i=0
while 2*lapin(i)<nb:
    i=i+1
print(" en",i,"mois",2*lapin(i),"lapins")
def ligne_chaine(n,ch):
    s=""
    if n>0:
        s=ch
        etoile=ch
        if n>1:
            for i in range(n-1):
                etoile+=ch
                s=s+"+"+etoile
    return s



n=int(input("Entrez un entier : "))
ch=input("Entrez une chaine : ")
for i in range(1,n+1):
    print(ligne_chaine(i,ch))
for i in range(n-1):
    print(ligne_chaine(n-1-i,ch))


==
mplsoluce0==
classique
3
*
==
mplsoluce1==
negatif
-9
+
==






