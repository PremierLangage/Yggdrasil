


#extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
#@ /builder/before.py [builder.py]

extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

image =$ Arbre.png

title= Des lapins ... 

text==
Un couple de lapins arrive sur l'ile de Quang Binh le 1er septembre. Ce couple a sa première portée à trois mois, puis une portée tous les mois.
Chaque portée est un couple de lapins. Tous les couples ainsi obtenus se reproduisent
de la même manière.<br>
1er septembre : 1 couple de jeunes lapins<br>
1er octobre : 1 couple de lapins d’un mois<br>
1er novembre : 1 couple de lapins de deux  mois<br>
1er décembre : 1 couple de jeunes lapins ,  1 couple de vieux<br>
1er janvier : 1 couple de jeunes lapins ,1 couple de  lapins d’un mois  1 couple de vieux, soit 3 couples.<br>
1er février : 1  couple de jeunes lapins ,1 couple de  lapins d’un mois et 1 couple de lapins de deux mois  et 1 couples de vieux, soit 4 couples.<br>

<br>
Ecrire une fontion `lapin(mois)` qui reçoit un entier décrivant le nombre de mois
 écoulé et renvoie le nombre de couples.(*On distinguera le nombre de couples de nouveaux lapins, le nombre
de couples de lapins ayant un mois, et le nombre de couples de lapins
ayant 2 mois ou plus*).<br>

On fera les doctest suivants :

    >>> lapin(4)
    2
    >>> lapin(43)
    8407925
    >>> 

plus d'autres ....


*d'après Laure Petrucci*
==




before==
def lapin(mois):
    if mois<0:
        return 0
    vieux=0    
    ado1=0
    ado2=0
    jeune=1
    
    for i in range(1,mois+1):
        vieux+=ado2
        ado2=ado1
        ado1=jeune
        jeune=vieux
    #return jeune,ado1,ado2,vieux
    return jeune+ado1+ado2+vieux

import random, sys

pltest1=""">>> lapin({})\n{}""".format(4, lapin(4))

n=random.randint(44,88)

pltest3=""">>> lapin({})\n{}""".format(n, lapin(n))
==

after==
def lapin(mois):
    if mois<0:
        return 0
    vieux=0    
    ado1=0
    ado2=0
    jeune=1
    
    if mois>1:
        for i in range(1,mois):
            vieux+=ado2
            ado2=ado1
            ado1=jeune
            jeune=vieux

    #return jeune,ado1,ado2,vieux
    return jeune+ado1+ado2+vieux
import random, sys
n=random.randint(44,89)



==


bb==
            s=" Mois "+str(i)+": "
            if jeune:
                s+= str(jeune)+" couples de lapins jeunes,"
            if ado1:
                s+= str(ado1)+ " couple de lapins d'un mois,"
            if ado2:
                s+=str(ado2)+ " couple de lapins de deux mois,"
            if vieux:
                s+= str(vieux)+" couples de vieux lapins"
            print(s)
==



pltest0==
>>> 
lapin(12)
60
==
