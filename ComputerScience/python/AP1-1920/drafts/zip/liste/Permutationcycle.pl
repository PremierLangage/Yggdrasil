

# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Cycle d'une permutation

text== 
Pour n entier naturel, une permutation p de $%\\{0..n\\}%$  est donnée par une 
liste permu avec permu[i]=c ssi p(i)=c.<br>
  On  appelle cycle d'une permutation p de $%\\{0..n\\}%$ 
   une suite de valeurs $%(a_0,a_1 \ldots a_l,l \le n )%$ 
  telle que: <br>
  $%p(a_i)=a_{i+1}%$ pour $% 0 \le i \lt l%$ et $%p(a_l)=a_0%$<br>
Exemple, en representant un cycle par une liste<br>
les cycles de la permutation p=[0,5,4,2,3,1] sont [0], [5,1] et [4,3,2].<br>
La liste des cycles est [[0],[1,5],[2,3,4)].<br>
Ecrire une fonction `perm2cycles` qui reçoit une permutation et renvoie la liste de ses cycles (ordonnée par ordre d'apparition du premier élément de chaque cycle)
Ecrire une fonction `cycles2perm` qui reçoit une liste de cycles et renvoie la permutation correspondante
==
before==
import random
def genere_permut(n):
    l=[x for x in range(n)]
    perm=[]
    for i in range(n):
        ind= random.randint(0,n-1-i)
        val=l[ind]
        perm.append(val)
        l[ind],l[n-1-i]=l[n-1-i],l[ind]
    return perm
def perm2cycles(l):
    lcycle=[]
    marque=list(l)
    for i in range(len(l)):
        if marque[i]!=-1:
            cycle=[i]
            elem=l[i]
            marque[i]=-1
            while elem!=i:
                 cycle.append(elem)
                 marque[elem]=-1
                 elem=l[elem]
                 
            lcycle.append(cycle)
    return lcycle
def cycles2perm(l):
    taille=0
    for i in range(len(l)):
        taille+=len(l[i])
    perm=[0]*taille
    for i in range(len(l)):
        cycle=l[i]
        for ind in range(len(cycle)-1):
            perm[cycle[ind]]=cycle[ind+1]
        perm[cycle[-1]]=cycle[0]
    return perm
    
taille=random.randint(1,20)
l=genere_permut(taille)

pltest1=""">>> perm2cycles({})\n{}""".format(l,perm2cycles(l))
taille=random.randint(1,20)
l=genere_permut(taille)
l=perm2cycles(l)
pltest2=""">>> cycles2perm({})\n{}""".format(l,cycles2perm(l))

after=before
==
pltest0==
>>> perm2cycles([1,0,2])==[[0,1],[2]]
True
==
