# OCE 11/09/2019 : KO

extends=template.pl

title=Exercice Suite Récurrente

#pltest==
#==

#FIXME see  doc 


doc==
with 
Soit la suite récurrente définie par u0 = -1 et pour tout entier n,
un+1 = f(un) avec f(x) = (-5x + 5)/(x2 + 1)
Écrire, en Python, une fonction suiteRec de paramètre n qui calcule le terme de rang n (pas d'affichage).

l'exercice me dit que j'ai bein travailler avec le code suivant 


def suiteRec(n):
    if n==0:
        return -10
    else:
        x=suiteRec(n-1)
        return ((-5)*x+2)/(x*x+1)

c'est plutot surprenant
==




