


import random 




HEIGTH= ( "7", "8", "9","Valet", "Dame", "Roi", "10","As")
COLOR= ("Coeur", "Carreau", "Trèfle", "Pique")
HEIGTHA= ( "7", "8", "Dame", "Roi", "10", "As", "9", "Valet")


def new_card(heigth, color):
    """
    retourne une nouvelle carte un tuple (heigth,  color)
    """
    return (heigth,  color)

def strength(card, atout):
    """
    Retourne l'Ordre de la carte 'card' pour l'atout 'atout':
    à la couleur indice dans l'ordre des cartes dans la couleur
    à l'atout 100 + indice dans l'ordre des atouts
    """
    if card[1] == atout:
        return 100+ HEIGTHA.index(card[0])
    else:
        return HEIGTH.index(card[0])


def deck():
    """
    retourne un jeu de 32 cartes pour la belote 
    une carte est un tuple ("7", "Carreau") hauteur couleur.
    """
    deck = []
    for i in HEIGTH:
        for j in COLOR:
            deck.append(new_card(i, j))
    return deck

def choixentame(deck,atout, pliss):
    """
    Choisi la carte dans le pdeck qui est la plus forte. 
    N'utiliser pas pliss pour le moment.
    """
    maxs=0
    maxc=None
    for c in deck:
        if strength(c,atout) > maxs:
            maxs=strength(c,atout)
            maxc=c
    deck.remove(maxc)
    return maxc 

def choixcarte(plis, deck,atout, pliss):
    """
    Choisi la carte dans le pdeck qui est la plus forte parmis les cartes légales.
    1) il faut d'abord fournir à la couleur de la première carte du plis.
    2) sinon il faut couper sauf si le partenaire est maitre.
    3) sinon il faut fournir une carte (la plus petite possible)
    On peut compliquer sans fin cette fonction en faisant des choix plus complexes.
    """
    couleur = plis[0][1] 
    cartes_legales = []
    # fournir à la couleur 
    for c in deck:
        if c[1] == couleur :
            cartes_legales.append(c)
    if cartes_legales:
        r =random.choice(cartes_legales)
        deck.remove(r)
        return r
    # sinon je coupe 
    for c in deck:
        if  c[1] == atout:
            cartes_legales.append(c)       
    if cartes_legales:
        # régle se la sous coupe 
        # si le partenaire len(plis)-2 est maitre 
        # Choisir une carte d'une autre couleur que l'atout
        # régle de monter à l'atout 
        r =random.choice(cartes_legales)
        deck.remove(r)
        return r
    # enfin je me défausse 
    cartes_legales = deck
    r =random.choice(cartes_legales)
    deck.remove(r)
    return r



def deal(deck, nb_cartes=5, nbjoueurs=4):
    """
    Distribue nb_cartes cartes du deck a nbjoueurs 
    retourne une liste de nbjoueurs listes de nb_cartes 
    """
    pd=[]
    for i in range(nbjoueurs):
        j=[]
        for k in range(nb_cartes):
            j[i%nbjoueurs].append(deck.pop())
        pd.append(j)
    return pd

def value(card,atout="Pique"):
    """
    retourne la valeur de la carte pour l'atout atout.
    """
    if card[1] == atout :
        if card[0] == "Valet":
            return 20
        elif card[0] == "9":
            return 14

    if card[0] == "As":
        return 11
    elif card[0] == "Valet":
        return 2
    elif card[0] == "Dame":
        return 3
    elif card[0] == "Roi":
        return 4
    elif card[0] == "10":
        return 10
    return 0

def belote_rebelote(deck,atout="Pique"):
    """
    Retourne si les deux cartes dame et roi d'atout sont dans le jeu 'deck'.
    """
    return new_card("Dame",atout) in deck and  new_card("Roi",atout) in deck

def gagnant(plis,atout):
    """
    le plis liste de quatres cartes jouées dans l'ordre 
    retourne le gagnant du plis (indice dans plis)
    on suppose que la première carte est celle jouée en premier (elle définie la couleur à fournir)
    """
    couleur = plis[0][1]
    streng=[0,0,0,0]
    print(f"plis={plis}")
    for c in  plis:
        if c[1] == couleur or c[1] == atout:
            print(f"c={c}")
            streng[plis.index(c)]= strength(c,atout)

    return streng.index(max(streng))

def pointsgagnes(pliss, atout):
    """
    plissne liste de plis (listes des cartes)
    retourne le nombre de points total des plis
    """
    pts = 0
    for plis in pliss:
        for c in plis:
            pts += value(c,atout)
    return  pts

def melange(deck, seed=None):
    """
    mélange le deck
    """
    if seed is not None:
        random.seed(seed)
    random.shuffle(deck)
