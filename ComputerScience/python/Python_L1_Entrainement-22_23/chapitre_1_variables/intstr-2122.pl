#author=Wenjie Fang

title=Entiers et chaîne

tag=input|print|variable|if|else|conditionnelles|type|operation

extends=/ComputerScience/python/template/soluce.pl
 
@ /builder/before.py [builder.py]

soluce==  
n=int(input())
m=int(input())
print(n+m)
print(str(n)+str(m))
==

code==
# lecture au clavier, affectation
n=int(input())
m=int(input())
==

text==
Ecrivez un programme qui prend deux entiers **n** et **m** et qui calcule la somme de **n** et **m**, 
et aussi la concaténation de l'écriture de **n** et **m** en chaîne de caractères.

**Exemples :**

Si **n**=10 et **m**=4, alors votre programme doit afficher

14

104

Si **n**=1 et **m**=-4, alors votre programme doit afficher

-3

1-4

Si **n**=-9 et **m**=0, alors votre programme doit afficher

-9

-90
==

before==#|python|
==

mplsoluce0==
Simple
10
4
==
mplsoluce1==
Un négatif
-1
4
==
mplsoluce2==
Un autre négatif
10000
-5
==
mplsoluce3==
C'est nul
100
0
==
mplsoluce4==
Reste nul
0
100
==
mplsoluce5==
Tous nuls
0
0
==
mplsoluce6==
Deux négatifs
-1
-2
==












