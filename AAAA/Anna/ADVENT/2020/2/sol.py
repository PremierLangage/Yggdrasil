import random
import re
from itertools import zip_longest

def builddata():
    tab = []
    
    for x in range(1000):
        subtab = []
        val = random.randint(0, 2)
        val1 = random.randint(1, 9)
        if val == 0:
            subtab.append('avant')
        if val == 1:
            subtab.append('bas')
        if val == 2:
            subtab.append('haut')
        subtab.append(str(val1))
        tab.append(subtab)
    return tab

def ToList(filec):
    return [x.split(' ') for x in filec.split('\n')] 

def Question1(array): 
    position = [0,0]
    for input in array:
        if input[0] == "avant":
            position[0] += int(input[1])
        elif input[0] == "haut":
            position[1] -= int(input[1])
        elif input[0] == "bas":
            position[1] += int(input[1])
    return position[0] * position[1]

def Question2(array):
    aim = 0
    position = [0,0]
    for input in array:
        if input[0] == "avant":
            position[0] += int(input[1])
            position[1] += (int(input[1]) * aim)
        elif input[0] == "haut":
            aim -= int(input[1])
        elif input[0] == "bas":
            aim += int(input[1])
    return position[0] * position[1]


def buildQ1(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([v[0] + ' ' + v[1] for v in data])
    return f"""[('''{fichier}''','{Question1(val)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'
    dataliteral = '\n'.join([v[0] + ' ' + v[1] for v in data])
    return f"""[('''{fichier}''','{Question2(val)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data)}','Tst data question2')]""", dataliteral



