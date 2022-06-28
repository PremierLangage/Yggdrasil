import random
import re

def builddata():
    tab = []
    val = random.randint(0, 200)
    tab.append(val)
    interval = random.randint(1,10)
    incOrDec = random.randint(0, 2)
    for x in range (500):
        if (val > 0) : 
            if (incOrDec == 0) : 
                val = val + interval
            elif (incOrDec == 1) : 
                val = val - interval
        else : 
            val = random.randint(0, 200)
        tab.append(val)
        interval = random.randint(1,10)
        incOrDec = random.randint(0, 2)
    return tab

def buildfile(filename):
    tab = builddata()
    with open(filename, "w") as file:
        for x in range(500):
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
        for j in range(i + 1, len(array)-1): 
            for k in range(j + 1, len(array)):
                if array[i] + array[j] + array[k] == 2020:
                    return array[i] * array[j] * array[k]

def getQ1Q2():
    buildfile("data")
    valeurs = fromFileToList("data")
    val = fromFileToList("exemple")
    print(Question2(val))
    q1 =  Question1(valeurs)
    q2 =  Question2(valeurs)
    return q1, q2

def build():
    Q1, Q2 = getQ1Q2()
    plt1= f"""
    >>> Question1() == {Q1} # Question1 
    True
    """
    plt2= f"""
    >>> Question2() == {Q2} # Question2 
    True
    """
    return plt1,plt2



