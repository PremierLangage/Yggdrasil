

extends = /ComputerScience/python/template/pltest.pl 

title= Recherche de mots dans un fichier 


before==
import psutil
==

text==

Objectif réécrire une commande à la mode "grep".

On suppose l'existance d'un fichier dans le répertoire courrant.  

Ecrire une fonction **mongrep(nomfichier, mot, option=True)** qui prend le nom du fichier et le mot recherche en paramètre.

Par défaut l'**option** de recherche est d'afficher les lignes contenant les mots. 

La fonction retourne le nombre de lignes contenant le mot.

==


solution==

def mongrep(filename, mot, option=True):
    compter=0
    with open(filename, "r") as f:
        for l in f.readlines():
            if mot in l:
                compter += 1 
                if option :
                    print(l,end='')
    return compter

==

@ input0.txt [data.txt]
@ input1.txt [version]

pltest==
>>> mongrep("data.txt", "terminer") #doctest: +NORMALIZE_WHITESPACE
terminer
1
>>> mongrep("data.txt", "terminer", option=False)
1
>>> mongrep("version","versio",option=False)
3
==







