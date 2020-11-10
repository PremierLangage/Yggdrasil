# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Apparition d'un chiffre


text==
On veut déterminer le nombre d'occurences d'un chiffre particulier dans
$%2^n%$, c'est-à-dire le nombre de fois où le chiffre particulier apparait
dans le nombre $%2^n%$.<br>

Par exemple, le chiffre $%4%$ apparait $%2%$ fois dans le nombre
$%2^{50} = 1125899906842624%$.<br>
<br>

Pour cela, écrire une fonction  `nombre_chiffres(exp, chiffre)`
qui reçoit un entier positif `exp` et un entier `chiffre` à un chiffre
et renvoie le nombre d'apparition du chiffre dans $%2^{exp}%$.<br>
 
Si `exp` n'est pas un entier positif ou si `chiffre` n'est pas un chiffre,
la fonction renverra `None`. <br>
<br>

**Attention : ** Votre code n'utilisera pas de chaine de caractères.
<br><br>

**Exemples :**<br>

`>>> nombre_chiffres(0,1)==1`<br>
`True`<br>
`>>> nombre_chiffres(8,1)`<br>
`0`<br>
`>>> nombre_chiffres(18,4)`<br>
`2`<br>
==

Xeditor.code==
def nombre_chiffres(n,c):
    if n<0 or not 0<=c<=9:
        return None
    nb=0
    n=2**n
    while  n>0:
        if n%10==c:
            nb+=1
        n//=10
    return nb
==
before==
import random
def nombre_chiffres(n,c):
    if n<0 or not 0<=c<=9:
        return None
    nb=0
    n=2**n
    while  n>0:
        if n%10==c:
            nb+=1
        n//=10
    return nb
n=random.randint(14,50)
c=random.randint(0,10)
pltest2=""">>> nombre_chiffres({},5)\n{}""".format(n,nombre_chiffres(n,5))

after=before
==
pltest0==
>>> nombre_chiffres(0,1)==1
True
==
pltest1==
>>> nombre_chiffres(67,9)
3
==




