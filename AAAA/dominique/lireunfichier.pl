
title= Recherche de mots dans un fichier 


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
                    print(l)
    return compter

==

@ input0.txt [data.txt]
@ input1.txt [version]

pltest==
>>> mongrep("data.txt", "terminer")
terminer
1
>>> mongrep("data.txt", "terminer", option=False)
==





