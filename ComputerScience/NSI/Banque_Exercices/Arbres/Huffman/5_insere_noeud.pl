
extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Insere noeud dans une liste triée

text==

Ecrire la fonction `insere(lst, noeud)` ayant en entrée:

- `lst` : une liste d'arbres et de feuilles triée (où les valeurs des arbres ou des feuilles sont 
classés dans l'odre décroissant), et
- `noeud` : un arbre ou une feuille

et qui insère le noeud (`Arbre`ou `Feuille`) dans la liste de manière à ce qu'elle soit toujours triée.

    >>> occurences = creer_occurences("c'est un test")
    >>> occurences_triees = creer_liste_triee(occurences)
    >>> occurences_triees[0].valeur
    3
    >>> occurences_triees[0].lettre
    't'

==

befor ==
def creer_occurences(texte):
    d = {}
    for caractere in texte:
        d[caractere] = d.get(caractere, 0) + 1
    return d

class Feuille:
    def __init__(self, lettre, valeur):
        self.valeur = valeur
        self.lettre = lettre

class Arbre:
    def __init__(self, valeur):
        self.valeur = valeur
        self.droite = None
        self.gauche = None

def creer_liste_triee(occurences):
    lst = []
    while len(occurences) != 0:
        m = -1
        for k, v in occurences.items():
            if v > m:
                m = v
                km = k
        lst.append(Feuille(km, m))
        del occurences[km]
    return lst
==


editor.code==

==

pltest==
>>> occurences = creer_occurences("c'est un test")
>>> occurences_triees = creer_liste_triee(occurences)
>>> insere(occurences_triees, Feuille('z', 5))
>>> occurences_triees[0].valeur
5
>>> occurences_triees[0].lettre
'z'
>>> insere(occurences_triees, Arbre(4))
>>> occurences_triees[0].valeur
5
>>> occurences_triees[1].valeur
4
>>> occurences_triees[2].valeur
3
==

soluce==
def insere(lst, noeud):
    if len(lst) != 0:
        i = len(lst) - 1
        while noeud.valeur > lst[i].valeur and i > 0:
            i -= 1
        lst.insert(i, noeud)  
    else:
        lst.insert(0, noeud)
==


