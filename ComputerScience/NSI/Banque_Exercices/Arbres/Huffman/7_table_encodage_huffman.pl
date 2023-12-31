
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
       ____5_            ___8________
      /      \          /            \
    e: 2    t: 3    ___4__         __4__(2,': 1,c: 1),(2,n: 1,u: 1)
                   /      \       /     \
                " ": 2   s: 2    2

et qui réalise les actions suivantes:

    tant que lst n'a pas qu'un seul élément
        récupère les deux derniers noeuds (`Arbre` ou `Feuille`) de la liste (normalement ce sont ceux qui ont les valeurs les plus petites)
        crée un nouveau noeud (de la classe `Arbre`) dont la valeur est la somme des valeurs des deux noeuds récupérés et donc les fils sont les deux noeuds récupérés
        insère ce nouveau noeud dans la liste (on appellera la fonction insere de la question précédente (même si on ne l'a pas faite))

et qui retournera l'arbre résultant située au seul emplacement 0 de la liste `lst`. On appelle cet arbre arbre de Huffman.



    >>> occurences = creer_occurences("c'est un test")
    >>> occurences_triees = creer_liste_triee(occurences)
    >>> arbre_h = arbre_huffman(occurences_triees)
    >>> arbre_h.valeur
    13
    >>> arbre_h.droite.valeur
    8
    >>> arbre_h.gauche.valeur
    5

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




