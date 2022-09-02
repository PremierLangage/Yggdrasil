import random
import re
from itertools import zip_longest

def builddata():
    tab = []
    for x in range(1500):
        val = random.randint(0, 1500)
        tab.append(val)
    return tab
    
def calculate_fuel(positions):
    min_pos = -1
    min_fuel = np.infty
    for pos in range(min(positions), max(positions)+1):
        fuel_needed = (np.abs(positions - pos)).sum()
        if fuel_needed < min_fuel:
            min_fuel = fuel_needed
            min_pos = pos
    return  min_fuel)

def Question1(file_name):
    with open(file_name, 'r') as f:
        lines = f.readlines()
        positions = [int(entry) for entry in lines[0].strip().split(',')]
    return calculate_fuel(np.array(positions))

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


