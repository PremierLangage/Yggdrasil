
import os
import random


def buildfile(fromfile, tofile):
    with open(fromfile, 'r') as g:
        lines = g.readlines()[:-1]

        antes = [lili.split(': ', 1)[1] for lili in lines]
    random.shuffle(antes)
    with open(tofile, 'w') as g:
        for i, x in enumerate(antes):
            g.write(f"Sue {i+1}: " + x)


def Question2(filename, DFU):
    with open(filename, 'r') as f:
        for line in f.readlines():
            d = {}
            l = line.strip().split(': ')
            num = int(l[0].split(" ")[1])
            d[l[1]] = int(l[2].split(", ")[0])
            d[(l[2].split(",")[1]).strip()] = int(l[3].split(", ")[0])
            d[(l[3].split(",")[1]).strip()] = int(l[4])
            fofo = True
            for k, v in d.items():
                if k in ["chats", "arbres"]:
                    if v <= DFU[k]:
                        fofo = False
                        break
                elif k in ["poméraniens", "carpes"]:
                    if v >= DFU[k]:
                        fofo = False
                        break
                elif DFU[k] != v:
                    fofo = False
                    break
            if fofo:
                print(num)


def Question1(filename, DFU):
    with open(filename, 'r') as f:
        for line in f.readlines():
            d = {}
            l = line.strip().split(': ')
            num = int(l[0].split(" ")[1])
            d[l[1]] = int(l[2].split(", ")[0])
            d[(l[2].split(",")[1]).strip()] = int(l[3].split(", ")[0])
            d[(l[3].split(",")[1]).strip()] = int(l[4])
            fofo = True
            for k, v in d.items():
                if DFU[k] != v:
                    fofo = False
                    break
            if fofo:
                print(num)


dFU = {
    "enfants": 3,
    "chats": 7,
    "samoyèdes": 2,
    "poméraniens": 3,
    "akitas": 0,
    "vizslas": 0,
    "carpes": 5,
    "arbres": 3,
    "voitures": 2,
    "parfums": 1,
}


def doit():
    buildfile("data1", "data")
    sol1 = Question1("data", dFU)
    sol2 = Question2("data", dFU)
    
    

    pltest= f"""
    >>> question1() == {sol1} # Question 1 étage 
    True
    """
    pltest2= f"""
    >>> question2() == {sol2} # Question 2 position 
    True
    """

    return pltest,pltest2