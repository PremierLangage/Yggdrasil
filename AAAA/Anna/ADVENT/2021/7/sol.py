import random
import re
import numpy as np
from itertools import zip_longest

def builddata():
    tab = []
    for x in range(1500):
        val = random.randint(0, 1500)
        tab.append(val)
    return tab

def ToList(filec):
    return [int(x) for x in filec.split(",")] 
    
def calculate_fuel(positions):
    min_pos = -1
    min_fuel = np.infty
    for pos in range(min(positions), max(positions)+1):
        fuel_needed = (np.abs(positions - pos)).sum()
        if fuel_needed < min_fuel:
            min_fuel = fuel_needed
            min_pos = pos
    return  min_fuel

def Question1(lines):
    return calculate_fuel(np.array(lines))

def calculate_fuel2(positions):
    min_pos = -1
    min_fuel = np.infty
    for pos in range(min(positions), max(positions)+1):
        distances = (np.abs(positions - pos))
        fuel_needed = sum([(n*(n+1))/2 for n in distances])
        if fuel_needed < min_fuel:
            min_fuel = fuel_needed
            min_pos = pos
    return min_fuel

def Question2(lines):
    return calculate_fuel2(np.array(lines))

def buildQ1(fichier,data):
    val = ToList(fichier)
    dataliteral = ','.join([str(v) for v in data])
    return f"""[('''{fichier}''','{Question1(val)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = ','.join([str(v) for v in data])
    return f"""[('''{fichier}''','{Question2(val)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data)}','Tst data question2')]""", dataliteral


