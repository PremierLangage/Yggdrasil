
# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Simplification par les chiffres
text== 
L'élève Ducobu doit simplifier la fraction $%\frac{26}{65}%$. Il supprime donc le *6* du numérateur et du dénominateur, écrit fièrement:<br>
$%\frac{26}{65}=\frac{2}{5}%$ et obtient sa première bonne note!<br>
Ecrire une fonction `simplifie_chiffre` qui reçoit un entier n et renvoie le nombre de fractions $%\frac{num}{den}%$ avec$%10 \leq num \lt den \lt n%$, 
 permettant à Ducobu de passer pour un bon élève.<br>
  Les simplifications du type $%\frac{20}{50}=\frac{2}{5}%$ sont trop exactes pour être comptées!

    >>> simplifie_chiffre(100)
    4
==
before==


def simplifDigit(num,den):  
    liste=[]
    n=str(num)
    d=str(den)
    for i in range(len(n)):
        for j in range(len(d)):
            if n[i]!='0' and n[i]==d[j]:
                    liste.append( [n[:i]+n[i+1:],d[:j]+d[j+1:]])
    return liste

def simplifie_chiffre(max):
    nb=0
    for n in range(10,max):
        for d in range (n+1,max):
            c=simplifDigit(n,d)
            for frac in c:
               if  int(frac[1])!=0 and int(frac[0])*d==int(frac[1])*n:
                # print(str(n)+"/"+str(d),"=",str(frac[0])+"/"+str(frac[1]))
                nb=nb+1                   
    return nb
import random

max=random.randint(100,1200)
pltest3=""">>> simplifie_chiffre({})\n{}""".format(max,simplifie_chiffre(max))

after=before
==

pltest1==
>>> simplifie_chiffre(100)==4
True
==
pltest2==
>>> simplifie_chiffre(1000) == 600 # Test avec un plus grand nombre 
True
==

