import random
import re
from itertools import zip_longest

def builddata():
    tab = []
    mystr = ''
    for x in range(1000):
        val = random.randint(0, 2)
        if val == 0:
            mystr += 'avant '
        if val == 1:
            mystr += 'bas '  
        if val == 2:
            mystr += 'haut '
        val1 = random.randint(0, 9)
        mystr += str(val1)
        mystr += ' '
        tab.append(mystr)
    return tab

def ToList(filec):
    return [x for x in filec.split('\n')] 


def Question1(array): 
    position = [0,0]
    for elem in array:
    input = input.split(" ")
    if input[0][0] == "f":
        position[0] += int(input[1])
    elif input[0][0] == "u":
        position[1] -= int(input[1])
    elif input[0][0] == "d":
        position[1] += int(input[1])
    print(position[0] * position[1])

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


