import random
import re
from itertools import zip_longest

def builddata():
    tab = []
    for x in range(300):
        val = random.randint(1, 6)
        tab.append(val)
    return tab

def ToList(filec):
    return [int(x) for x in filec.split(",")] 

def simulate_days(days, ages):
    for day in range(1, days+1):
        new_fish = ages.count(0)
        ages = [a-1 if a>0 else 6 for a in ages]
        ages += [8] * new_fish
    return(len(ages))

def Question1(ages, days):
    res = simulate_days(days, ages)
    return res

def simulate_days2(days, fish_at_stage):
    for day in range(1, days+1):
        expired_fish = fish_at_stage.pop(0)
        fish_at_stage[6] += expired_fish
        fish_at_stage.append(expired_fish)
    return sum(fish_at_stage)

def Question2(ages, days):
    fish_at_stage = [ages.count(i) for i in range(9)]
    res = simulate_days2(days, fish_at_stage)
    return res

def buildQ1(fichier,data):
    val = ToList(fichier)
    dataliteral = ','.join([str(v) for v in data])
    return f"""[('''{fichier}''','{Question1(val,80)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data,80)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = ','.join([str(v) for v in data])
    return f"""[('''{fichier}''','{Question2(val,256)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data,256)}','Tst data question2')]""", dataliteral


