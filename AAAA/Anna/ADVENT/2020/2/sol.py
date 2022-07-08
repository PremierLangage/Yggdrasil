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
    lst = []
    lst_tmp = []
    for line in filec.split('\n'):
        freq, letter, password = line.split(" ")
        letter = letter[:len(letter) - 1]
        low, high = map(int, freq.split('-'))
        lst_tmp.append(low)
        lst_tmp.append(high)
        lst_tmp.append(letter)
        lst_tmp.append(password)
        lst.append(lst_tmp)
    return lst

def Q1(low, high, letter, password):
    count = 0
    for char in password:
        if char == letter:
            count += 1
    return high >= count >= low

def Question1(array): 
    out = 0
    for input in array:
        if Q1(input[0], high, letter, password):
            out1 += 1
    return out

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



