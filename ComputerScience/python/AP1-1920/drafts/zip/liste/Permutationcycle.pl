

# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Cycle d'une permutation

text== 
Pour n entier naturel, une permutation p de $%\\{0..n\\}%$  est donnée par une liste permu[i]=c ssi p(i)=c.<br>
ainsi la permutation p de $%\\{0..4\\}%$ : <br>$%p(i)= 2i\mod 5 %$, <br>
est représentée par la liste [0,2,4,1,3].<br>
  On  appelle cycle d'une permutation p de $%\{0..n\}%$  un suite de valeurs $%a_0,a_1ldots a_l,l \le n %$ 
  telle que: $%p%(a_i)=a_{i+1},0 \le i \lt l%$ et $%p(a_l)=a_0%$<br>
Exemple, en representant un cycle par une liste<br>
les cycles de la permutation p=[0,5,4,2,3,1] sont [0][5,1][4,3,2].<br>
La liste des cycles est [[0],[5,1],[4,3,2)].<br>
Ecrire une fonction qui reçoit une permutation et renvoie la liste de ses cycles (ordonnée par ordre d'apparition du premier élément de chaque cycle)
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
def cycles(l):
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

taille=random.randint(1,20)
l=genere_permut(taille)

pltest1=""">>> cycles({})\n{}""".format(l,cycles(l))
after=before
==
pltest0==
>>> cycles([1,0,2],1)==[[1,0],[2]]
True
==
