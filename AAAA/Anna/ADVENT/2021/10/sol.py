import random
import re

def builddata():
    characters = ['(',')','[',']','{','}']
    tab = []
    for x in range(100):
       val = random.randint(0, 5)
       tab.append(characters[val])
    return tab

def ToList(filec):
    return [x for x in filec.split('\n')] 

def Question1(array):
    illegal_points = {
    ')': 3,
    ']': 57,
    '}': 1197,
  
    }
    illegal_chars = []
    for input in array:
        stack = []
        for char in input:
  
            is_sq = char == ']' and len(stack) > 0 and stack[-1] == '['
            is_cl = char == '}' and len(stack) > 0 and stack[-1] == '{'
            is_ci = char == ')' and len(stack) > 0 and stack[-1] == '('
            if is_gt or is_sq or is_cl or is_ci:
                stack.pop()
            elif char in ['(', '[', '{']:
                stack.append(char)
            else:
                illegal_chars.append(char)
                break
    return sum([illegal_points[char] for char in illegal_chars])

def Question2(array):
    return 0

def buildQ1(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([ str(v) for v in data])
    return f"""[('''{fichier}''','{Question1(val)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([ str(v) for v in data])
    return f"""[('''{fichier}''','{Question2(val)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data)}','Tst data question2')]""", dataliteral

