import random
import re
from itertools import zip_longest

def builddata():
    tab = []
    subtab = []
    for x in range(1000):
        val = random.randint(0, 2)
        val1 = random.randint(0, 9)
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
    
    return 0

def Question2(array):
    return 0


def buildQ1(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'
    dataliteral = '\n'.join([data[i][j] for i in range(len(data)) for j in range(len(data[i]))])
    return f"""[('''{fichier}''','{Question1(val)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([data[i][j] for i in range(len(data)) for j in range(len(data[i]))])
    return f"""[('''{fichier}''','{Question2(val)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data)}','Tst data question2')]""", dataliteral


