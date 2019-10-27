



# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Suite de Fibonacci
text==  

On appelle "Suite de Fibonacci" la suite d'entier définie par <br>
%$f_0=0%$<br>
%$f_1=1%$<br>
%$f_{n+2}=f_{n+1}+f_{n}%$<br>
Ecrire une fonction *fibo)* qui recoit un nombre entier $%n%$ et.renvoie la liste  des 
$%n%$ premiers nombres de la suite (de $%f_0%$ jusqu'à $%f_{n-1}%$)<br>
  >>>fibo(2)<br>
[0,1]<br>
>>>fibo(5)<br>
[0,1,1,2,5]<br>
>>>fibo(-2)<br>
[]<br>
==
before==
def fibo(n):
    if n<=0:
        return []
    if n==1:    
        return [0]
    if n==2:
        return [0,1]
    l=[0,1]
    for i in range(2,n):
        l.append(l[i-1]+l[i-2])
    return l
import random

n=random.randint(11,51)

pltest3=""">>> fibo({})\n'{}'""".format(n,fibo(n))

after=before
==



pltest0==
>>> fibo(2)==[0, 1]
True
==
pltest1==
>>> fibo(-9)
[]
==
pltest2==
>>> fibo(11)
[0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
==





