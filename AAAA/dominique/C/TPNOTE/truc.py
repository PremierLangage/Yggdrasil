

import random

def liste_croissante():
    u=1
    l=[]
    for i in range(random.randint(5,15)):
        u += random.randint(2,100)
        l.append(u)
    return l

def liste_decroissante():
    l = liste_croissante()
    l.reverse()
    return l

def liste_constante():
    u = random.randint(56,178)
    return [ u for i in range(22)]

def indetermine():
    r=  random.randint(1,3) 
    if r==1:
        return liste_croissante()+liste_constante()+liste_decroissante()
    elif r==2:
        return liste_constante()+liste_decroissante()+liste_croissante()
    elif r==3:
        return liste_decroissante()+liste_croissante()



def mkmplsoluce(dir):

    """
    Produit des fichiers de solution pour les tests de la forme :
    ```
    Nom du test 
    entrée
    sur 
    plusieurs 
    lignes
    ```
    """

    if dir == 1 : # croissante
        text = "Croissante\n"
        for x in liste_croissante():
            text += str(x) + "\n"   
    elif dir == 2 : # décroissante 
        text = "Décroissante\n"
        for x in liste_decroissante():
            text += str(x) + "\n"
    elif dir == 3 : # constante
        text = "Constante\n"
        for x in liste_constante():
            text += str(x) + "\n"
    elif dir == 4 : # indéterminée
        text = "Indéterminée\n"
        for x in indetermine():
            text += str(x) + "\n"
    text += "-3\n"
    return text

def listofmplsoluce():
    l =[mkmplsoluce(i) for i in range(1,5)]
    random.shuffle(l)
    return l


def mpsolucesplateau():
    return [mkmplsoluce(4) for i in range(1,5)]
    

