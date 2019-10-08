
ends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Saisie d'une suite croissante


text==  

Ecrire un programme qui effectue la saisie controlée d'un type de variable,
(on demande un type tand qu'on n'a pas lu "str" ou "int") puis
lit une suite de valeurs dece type tant quelles forment une suite strictement croissante. 

Lorsque la suite n'est plus croissante, la saisie s'arrête et 
le programme affiche la longueur de la suite croissante.
==

code==

print("Vous avez entré",nb,"valeur(s) en ordre croissant")
==

before==
import random
N=random.randint(4,10)
mplsoluce6="Test aléatoire\n"
if random.randint(0,1)==0:
    mplsoluce6 +="str\n"
else:
    mplsoluce6 +="str\n"
v=40
for i in range(N):
    v += random.randint(1,6)
    mplsoluce6 += str(v)+"\n"
mplsoluce4 += str(v-10)+"\n"
==

# dr soluce qui marche avec des chaines ;)
solucedr==
nb=1
prev=input()
next=input()
while prev<next:
    prev,next = next, input()
    nb+=1

print("Vous avez entré",nb,"valeur(s) en ordre croissant")
==


soluce==
typ=""
While typ!= "int" and type!="str":
    print("entrez le type (int ou str)")
    typ=input()

nb=1
if typ="str":
    prec=input()
    suiv=input()
else
    prec=int(input())
    suiv=int(input())

while suiv> prec:
    nb+=1
    prec=suiv
    if typ="str":
        prec=input()
    else
    suiv=int(input())
print("Vous avez entré",nb,"valeur(s) en ordre croissant")
==
mplsoluce0==
5 int
int
2 
3
5
14
77
0
==

mplsoluce1==
5 str
toto
str
2 
3
5
14
77
0
==
mplsoluce2==
Une seul
int
4
1
==
mplsoluce3==
Plateau
str
4
4
1
==


mplsoluce4==
Départ négatif
str
-4
4
2
2
==


mplsoluce5==
Des chaines
annanas
bannana
papel
mango
==



