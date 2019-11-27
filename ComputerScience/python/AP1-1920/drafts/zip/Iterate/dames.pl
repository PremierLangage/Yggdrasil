

# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Echiquier
text== 
On place des dames sur un echiquier (8X8). La place de chaque dame est donné par un couple d'entiers.<br>
Une dame se déplace dans tous les sens (horizontalement, verticalement, diagonalement).<br>
Le problème consiste à déterminer le nombre de cases qui sont attaquée par au moins une dame.<br>
Ecrire une fonction `attaque` qui reçoit une position de dames et un échiquier et renvoie le nombre 
de nouvelles cases attaquées.<br>
>>> attaque((0,0),echiquier)<br>
22 (si la dame en (0,0) est la premiére traitée)<br>
Ecrire une fonction `dames` qui reçoit la  liste des positions des dames et renvoie le nombres de cases attaquées.<br>
(On considère qu'une dame attaque sa propre case.)<br>
>>> dames([(0,0),(7,7)])
38
==
before==

def attaque(dame,echiquier):
    n=0
    posx,posy=dame[0],dame[1]
    for x  in range(8):
       #horiz
       if echiquier[x][posy]==0:
            echiquier[x][posy]=1
            n+=1
       #vertic
       if echiquier[posx][x]==0:
           echiquier[posx][x]=1
           n+=1
       y=x+posy-posx
       if 0<=y<8 and  echiquier[x][y]==0:
           echiquier[x][y]=1
           n+=1
       y=-x+posy+posx
       if 0<=y<8 and  echiquier[x][y]==0:
           echiquier[x][y]=1
           n+=1    
    return n

def dames(lst):
    ech=[]
    for i in range(8):
        l=[]
        for j in range(8):
            l.append(0)
        ech.append(l)
    nb=0
    for dame in lst:
        nb+=attaque(dame,ech)
    return nb 

import random
lst=[]
n=random.randint(0,10)
for i in range(n):
    x=random.randint(0,7)
    y=random.randint(0,7)
    lst.append((x,y))
pltest3=""">>> dames({})\n{}""".format(lst,dames(lst))
after=before
==
pltest1==
>>> dames([(0,0),(7,7)])
38
==
pltest2==
>>> dames([(0,0),(7,7),(1,1)])
44
==

editor.code==
def dames(lst):
    if lst==[(0,0),(7,7)]:
        return 38
    else:
        return 44
==

