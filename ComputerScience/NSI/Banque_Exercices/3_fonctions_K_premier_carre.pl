
#author=OCE

# Heritage d'un type d'exercice 
extends = /ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

title = Afficher les k premiers carrés (de 0 à (k-1)^2)

code==

==

text==  

Programmer une fonction **carre** qui prend en paramètre un entier et retourne son carré.<br>

Programmer ensuite une fonction **premiers_carres** qui : <br>
* prend en paramètre un entier k <br>
* affiche (imprime) les k premiers carrés de 0 à (k-1)^2 <br>

==

# Pour info
solution==
def carre(n):
    return(n*n)

def premiers_carres(k) :
    for i in range(k) :
        print(carre(i))
==

before==
def carre(n):
    return(n*n)

def premiers_carres(k) :
    liste = ""
    for i in range(k) :
        liste += str(carre(i)) + "\n"
    return liste

pltest1 = """>>> premiers_carres(2)
{}>>> premiers_carres(4)
{}>>> premiers_carres(20)
{}
""".format(premiers_carres(2), premiers_carres(4), premiers_carres(20))
==

pltest0==
>>> carre(2)
4
>>> carre(4)
16
>>> carre(-8)
64
==








