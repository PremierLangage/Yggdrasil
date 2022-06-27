import random
import re

def builddata():
    tab = []
    ok = False
    for x in range (200):
        val = random.randint(x, 2020)
        if 2020 - val in tab and ok == True :
            val = random.randint(x, 2020)
        elif 2020 - val in tab and ok == False : 
            ok = True
        tab.append(val)
    ok = False
    for i in range(len(tab)):
        for j in range(i+1,len(tab)):
            if array[i] + array[j] == 2020:
                ok = True
    if (ok == False):
        randIndice1 = random.randint(0, 200)
        randIndice2 = random.randint(0, 200)
        if (randIndice1 == randIndice2) : 
            randIndice1 = random.randint(0, 200)
            randIndice2 = random.randint(0, 200)
        else : 
            tab[randIndice2] = 2020 - tab[randIndice1]
    return tab

def buildfile(filename):
    tab = builddata()
    with open(filename, "w") as file:
        for x in range(200):
            file.write(str(tab[x])+"\n")

def fromFileToList(filename):
    with open(filename, "r") as file:
        return [int(x[:-1]) for x in file.readlines()]

def getResults(array):
    for i in range(len(array)):
        for j in range(i+1,len(array)):
            if array[i] + array[j] == 2020:
                return array[i] * array[j]

def getQ():
    buildfile("data")
    valeurs = fromFileToList("data")
    return getResults(valeurs)


def build():
    res = getQ()
    plt1 = f"""
    >>> Question1() == {res}
    True
    """
    return plt1

with open("ennonce.md","r") as f:
    lenonce = f.read()


