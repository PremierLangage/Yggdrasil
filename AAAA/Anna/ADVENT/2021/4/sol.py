import random
import re
from itertools import zip_longest

def builddata():
    tab = []
    numbers = []
    for z in range(100):
        tab1 = []
        for x in range(5):
            tab2 = []
            for y in range(5):
                val = random.randint(0, 99)
                if val not in numbers : 
                    numbers.append(val)
                tab2.append(val)
            tab1.append(tab2)
        tab.append(tab1)
    return tab

def ToList(filec):
    return [x for x in filec.split('\n')] 

def polarity(array):
    polarity = []
    for string in array:
        polarity = [
            s + (1 if x == '1' else -1)
            for s, x in zip_longest(polarity, string, fillvalue=0)
        ]
    return polarity

def Question1(array): 
    pol = polarity(array)
    gamma = sum([2**i for i, x in enumerate(reversed(pol)) if x > 0])
    epsilon = sum([2**i for i, x in enumerate(reversed(pol)) if x < 0])
    return gamma * epsilon

def Question2(array):
    ar1 = array
    ar2 = array
    position = 0
    while position < len(array[0]):
        if len(ar1) == 1 and len(ar2) == 1:
            break
        if len(ar1) > 1:
            map1 = {k: [] for k in [0,1]}
            for elem in ar1:
                bit = int(elem[position])
                map1[bit].append(elem)
            if len(map1[0]) > len(map1[1]):
                ar1 = map1[0]
            else:
                ar1 = map1[1]
        if len(ar2) > 1:
            map2 = {k: [] for k in [0,1]}
            for elem in ar2:
                bit = int(elem[position])
                map2[bit].append(elem)
            if len(map2[1]) < len(map2[0]):
                ar2 = map2[1]
            else:
                ar2 = map2[0]
        position += 1
    return int(ar1[0], 2) * int(ar2[0], 2)


def buildQ1(fichier,data):
    val = ToList(fichier)
    print(Question1(val))
    dataliteral = '\n'.join([v for v in data])
    return f"""[('''{fichier}''','{Question1(val)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([ v for v in data])
    return f"""[('''{fichier}''','{Question2(val)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data)}','Tst data question2')]""", dataliteral


