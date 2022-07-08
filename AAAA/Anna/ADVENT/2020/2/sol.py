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
        ar = line.split(' ')
        if len(ar) == 3:
            freq, letter, password = ar[0], ar[1], ar[2]
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
        if Q1(input[0], input[1], input[2], input[3]):
            out += 1
    return out

def Q2(position1, position2, letter, password):
    return (password[position1] == letter) ^ (password[position2] == letter)

def Question2(array):
    out = 0
    for input in array:
        if Q2(input[0]-1, input[1]-1, input[2], input[3]):
            out += 1
    return out


def buildQ1(fichier,data):
    val = ToList(fichier)
    dataliteral = fichier
    return f"""[('''{fichier}''','{Question1(val)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'
    dataliteral = '\n'.join([v[0] + ' ' + v[1] for v in data])
    return f"""[('''{fichier}''','{Question2(val)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data)}','Tst data question2')]""", dataliteral



