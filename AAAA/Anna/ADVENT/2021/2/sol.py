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
    return [x.split(' ') for x in filec.split('\n')] 

def Question1(array): 
    position = [0,0]
    for elem in array:
        if elem[0][0] == "avant":
            position[0] += int(elem[1])
        elif elem[0][0] == "haut":
            position[1] -= int(elem[1])
        elif elem[0][0] == "bas":
            position[1] += int(elem[1])
    return position[0] * position[1]

def Question2(array):
    return 0


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


