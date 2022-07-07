import random
import re

def builddata():
    tab = []
    val = random.randint(0, 200)
    tab.append(val)
    interval = random.randint(1,10)
    incOrDec = random.randint(0, 1)
    for x in range(1999):
        while (interval == 0) :
            interval = random.randint(1,10)
        if (incOrDec == 0) : 
            val = val + interval
        elif (incOrDec == 1) : 
            if (val - interval < 0) :
                val = val + interval 
            else : 
                val = val - interval 
        if (val != tab[-1]) : 
            tab.append(val)
        interval = random.randint(1,10)
        incOrDec = random.randint(0, 2)
    return tab

def ToList(filec):
    return [int(x) for x in filec.split('\n')] 

def Question1(array):
    isIncreased = 0
    for i in range(1, len(array)):
        if array[i] > array[i-1]:
            isIncreased += 1
    return isIncreased

def Question2(array):
    tags = []
    tag1 = 0
    tag2 = 0
    tag3 = 0
    if len(array) >= 3 :
        for i in range(len(array) - 2):
            if i == 0: 
                tags.append([tab[i] + [tab[i+1] + tab[i+2]])
                tag1 += 1
            if i == 1: 
                tags.append([tab[i]])
                tag1 += 1
                tag2 += 1

def buildQ1(fichier,data):
    val = ToList(fichier)
    print(Question1(val))
    dataliteral = '\n'.join([ str(v) for v in data])
    return f"""[('''{fichier}''','{Question1(val)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([ str(v) for v in data])
    return f"""[('''{fichier}''','{Question2(val)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data)}','Tst data question2')]""", dataliteral

