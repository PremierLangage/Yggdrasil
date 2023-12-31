
extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Table d'encodage de Huffman

text==

Ecrire la fonction `table_encodage(arbre)` ayant en entrée `arbre` un arbre de huffman et retournant un dictionnaire 
ayant comme clé les lettres des feuilles de l'arbre et comme valeur le codage correspondant en lisant l'arbre comme ceci:

- on ajoute un 0 quand on descend à gauche 
- on ajoute un 1 quand on descend à droite

ainsi, quand l'arbre est le suivant:

            _____13________
           /               \
       ____5_            ___8_____________
      /      \          /                 \
    e: 2    t: 3    ___4__           _____4_____
                   /      \         /           \
                " ": 2   s: 2    __2__         __2__
                                /     \       /     \
                              ': 1   c: 1   n: 1    u: 1

le codage de `e` est `00`.

le codage de `s` est `101`.

Cette fonction est *récursive*, et utilise [`isinstance`](https://www.programiz.com/python-programming/methods/built-in/isinstance) pour déterminer si le noeud actuel est une `Feuille` ou un `Arbre`



    >>> occurences = creer_occurences("c'est un test")
    >>> occurences_triees = creer_liste_triee(occurences)
    >>> arbre_h = arbre_huffman(occurences_triees)
    >>> 

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

def insere(lst, noeud):
    if len(lst) != 0:
        i = len(lst) - 1
        while noeud.valeur > lst[i].valeur and i >= 0:
            i -= 1
        lst.insert(i + 1, noeud)  
    else:
        lst.insert(0, noeud)

def arbre_huffman(lst):
    i = 0
    while len(lst) > 1:
        i += 1
        noeud1 = lst.pop()
        noeud2 = lst.pop()
        nouveau_noeud = Arbre(noeud1.valeur + noeud2.valeur)
        nouveau_noeud.gauche = noeud1
        nouveau_noeud.droite = noeud2
        insere(lst, nouveau_noeud)
    return lst[0]


==


editor.code==

==

pltest==
>>> occurences = creer_occurences("c'est un test")
>>> occurences_triees = creer_liste_triee(occurences)
>>> arbre_h = arbre_huffman(occurences_triees)
>>> arbre_h.valeur
13
>>> arbre_h.droite.valeur == 8 or arbre_h.droite.valeur == 5
True
==

soluce==
def table_encodage(arbre):
    ...
==




