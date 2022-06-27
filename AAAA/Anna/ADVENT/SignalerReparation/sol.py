import random
import re

def builddata():
    tab = []
    tab1 = [r for x in range(200)]
    ok = false
    for x in range (200):
        val = random.randint(x, 2020)
        if 2020 - val in tab and !ok : 
            tab.append(val)
            ok = true
        if 2020 - val in tab and ok :
            val = random.randint(x, 2020)
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


