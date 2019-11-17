
# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Suite de Conway
text== 
Chaque terme de la suite de Conway se construit en  en indiquant combien de fois chacun de ses chiffres se répète. <br>
Pendant la construction, on regarde donc un chiffre comme nombre ou comme caractére<br>
On commence avec $%x_0=1%$,<br>
Ce terme comporte simplement un « 1 ». Par conséquent,<br>
$%x_1=11%$, ce terme comporte  deux « 1 ».<br>
$%x_2=21%$, puis <br>
$%x_3=1211%$, $%x_4=111221%$, $%x_5=312211%$, $%x_{6}=13112221%$<br>
Ecrire un fonction `suite_Conway` qui reçoit un entirt positif $%n%$`et renvoie la chaine de caractères n$%^{ieme}%$
terme de la suite.
==
editor.code==
def suite_Conway(n):
    if n==0:
        return '1'
    elif n==3:
        return '1211'
    else:
        return '42'
==
before==
def suite_Conway(n):
    terme,indice='1',0
    for indice in range(n):
        nv=''
        prec,nb=terme[0],1
        for i in range(1,len(terme)):
            l=terme[i]
            if l==prec:
                nb+=1
            else:
                nv+=str(nb)+prec
                prec,nb=l,1
        terme=nv+str(nb)+prec
    return terme

import random
n=random.random(7,11)
pltest3=""">>> suite_Conway({})\n{}""".format(n,suite_Conway(n))


pltest1==
>>> suite_Conway(0)=='1'
True
==
pltest2==
>>> suite_Conway(3)=='1211'
True
==
