import random

def builddata(filename):
    with open(filename, "w") as file:
        for x in range(random.randint(0, 200)):
            g.write(str(random.randint(x, 2020))+"\n")

def fromFileToList(filename):
    with open(filename, "r") as file:
        return [x for x in file.readlines()]

def getResults(array):
    for i in range(len(array)):
        for j in range(i+1,len(array)):
            if array[i] + array[j] == 2020:
                return array[i] * array[j]

def getQ():
    builddata("data")
    valeurs = fromFileToList(data)
    return getResults(array)


def build():
    r = getQ()

    plt = f"""
    >>> Question1() == {Q1} # Question 1
    True
    """
    return plt1, plt2

def build():


arr = fromFileToList("exemple")
res = getResults(arr)

print(res)