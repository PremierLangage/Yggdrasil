import random

def builddata(filename):
    with open(filename, "w") as file:
        for x in range(random.randint(0, 200)):
            g.write(str(random.randint(x, 2020))+"\n")

def fromFileToList(filename):
    with open(filename, "r") as file:
        return [x for x in file.readlines()]

