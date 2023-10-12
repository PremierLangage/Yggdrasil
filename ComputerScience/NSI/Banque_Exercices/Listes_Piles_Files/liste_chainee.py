def creer_liste():
    return [None]

def inserer_tete(liste, elem):
    """ajoute un maillon de valeur val en tête de liste"""
    liste[0] = [elem, liste[0]]

def taille(liste):
    """renvoie le nombre d’éléments de la liste L"""
    maillon = liste[0]
    cpt = 0
    while maillon != None:
        cpt += 1
        maillon = maillon[1]
    return cpt

def afficher(liste):
    maillon = liste[0]
    affichage = ""
    cpt = 0
    while maillon != None:
        cpt += 1
        affichage += f"|{maillon[0]}|*|-->"
        maillon = maillon[1]
    
    affichage = affichage[:-6] + "|None|"
    print(affichage)

def get_maillon_indice(liste, i):
    """renvoie le maillon d’indice i """
    maillon = liste[0]
    cpt = 0
    while maillon != None:
        if cpt == i:
            return maillon
        cpt += 1
        maillon = maillon[1]
    return None

def inserer_apres(L, val, M):
    """insert un nouveau maillon de valeur val après le maillon M"""
    Nouveau = [val, M[1]]
    M[1] = Nouveau


def est_vide(L):
    """renvoie vrai si la liste L est vide"""
    return len(L) == 0

def get_valeur_maillon_indice(L, i):
    """renvoie la valeur du maillon d’indice i"""
    return get_maillon_indice(L, i)[0]

def set_maillon_indice(L, i, val) :
    get_maillon_indice(L, i)[0] = val
    """modifie la valeur du maillon d’indice i à val"""

def supprimer_tete(L) :
    """supprime le maillon de tête"""
    L[0] = get_maillon_indice(L, 1)

def supprimer_apres(L, M):
    """supprime le maillon qui suit le maillon M"""
    M[1] = M[1][1]


# def creer_liste():
#     return None

# def inserer_tete(liste, elem):
#     return (elem, liste)

# def creer_liste():
#     return {'tete': None}

# def inserer_tete(liste, elem):
#     liste['tete']={'elem':elem,'suivant':liste['tete'] }
