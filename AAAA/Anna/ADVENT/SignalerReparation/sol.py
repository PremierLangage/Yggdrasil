import random
import re

def builddata():
    """
    a list of integers with at least a pair that addeds to 2020

    """
    tab = [random.randint(1, 2020) for x in range(200)]
    tab.append(2020-tab[0]) # a solution 
    return tab

def buildfile(filename):
    tab = builddata()
    with open(filename, "w") as f:
        for x in tab:
            print(x,file=f)

def fromFileToList(filename):
    with open(filename, "r") as f:
        return [int(x) for x in f.readlines()]

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


#with open("ennonce.md","r") as f:
#    lenonce = f.read()


