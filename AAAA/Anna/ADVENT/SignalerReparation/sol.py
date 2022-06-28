import random
import re

def builddata():
    tab = []
    okFor2 = False
    okFor3 = False
    for x in range (200):
        val = random.randint(0, 2020)
        while 2020 - val in tab and okFor2 == True :
            val = random.randint(0, 2020)
        if 2020 - val in tab and okFor2 == False : 
            okFor2 = True
        tab.append(val) 
    okFor2 = False
    for i in range(len(tab)):
        for j in range(i+1,len(tab)):
            if tab[i] + tab[j] == 2020:
                okFor2 = True
    if (okFor2 == False):
        randIndice1 = random.randint(0, 200)
        randIndice2 = random.randint(0, 200)
        while (randIndice1 == randIndice2) : 
            randIndice1 = random.randint(0, 200)
            randIndice2 = random.randint(0, 200) 
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

def Question1(array):
    for i in range(len(array)):
        for j in range(i+1,len(array)):
            if array[i] + array[j] == 2020:
                return array[i] * array[j]

def Question2(array):
    for i in range( 0,len(array)-2):
  
        # Fix the second element as A[j]
        for j in range(i + 1, arr_size-1): 
              
            # Now look for the third number
            for k in range(j + 1, arr_size):
                if A[i] + A[j] + A[k] == sum:
                    print("Triplet is", A[i],
                          ", ", A[j], ", ", A[k])
                    return True
      
    # If we reach here, then no 
    # triplet was found
    return False

def getQ():
    buildfile("data")
    valeurs = fromFileToList("data")
    return Question1(valeurs)


def build():
    res = getQ()
    plt1 = f"""
    >>> Question1() == {res}
    True
    """
    return plt1

with open("ennonce.md","r") as f:
    lenonce = f.read()


