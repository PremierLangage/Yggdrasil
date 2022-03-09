
extends = /ComputerScience/python/template/pltest.pl

title= Affiche caractere 

text==


Ecrire une fonction **affiche_caractere(point_de_code)** qui affiche le caractere de point de code `point_de_code`.


==

taboo=isupper|islower

reponse==
def affiche_caractere(point_de_code):
    print(chr(point_de_code))
==

pltest==
>>> affiche_caractere(8765)
∽
>>> affiche_caractere(0x0976)
ॶ
>>> affiche_caractere(0b1001110)
N
==


