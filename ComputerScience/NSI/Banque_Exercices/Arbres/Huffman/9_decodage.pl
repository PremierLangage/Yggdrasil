
extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Décodage

text==

Ecrire la fonction `decodage(code, encodage)` ayant en entrée `code` 
une chaine de caractères comportant uniquement des 1 
et des 0 correspondant au codage d'une texte et `encodage` une 
table d'encodage provenant de l'arbre de huffman et retournant la suite 
de 0 et de 1 correspondant au texte codé (de type `str`)

Exemple : 

    >>> occurences = creer_occurences("c'est un test")
    >>> occurences_triees = creer_liste_triee(occurences)
    >>> arbre_h = arbre_huffman(occurences_triees)
    >>> encodage = table_encodage(arbre_h)
    >>> decodage('11011100001010110011111110100010010101', encodage)
    "c'est un test"
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

def table_encodage(arbre, code = ""):
    d = {}
    if isinstance(arbre, Feuille):
        d[arbre.lettre] = code
        d[code] = arbre.lettre
        return d
    d.update(table_encodage(arbre.gauche, code + "0"))
    d.update(table_encodage(arbre.droite, code + "1"))
    return d

def codage(texte, hufdict):
    ret = ""
    for carac in texte:
        ret += hufdict[carac]
    return ret

==


editor.code==

==

pltest==
>>> occurences = creer_occurences("c'est un test") #
>>> occurences_triees = creer_liste_triee(occurences) #
>>> arbre_h = arbre_huffman(occurences_triees) #
>>> encodage = table_encodage(arbre_h) #
>>> decodage('11011100001010110011111110100010010101', encodage)
"c'est un test"
==

soluce==
def decodage(code, hufdict):
    texte = ""
    caraccode = ""
    for bit in code:
        caraccode += bit
        if caraccode in hufdict:
            texte += hufdict[caraccode]
            caraccode = ""
    return texte
==






