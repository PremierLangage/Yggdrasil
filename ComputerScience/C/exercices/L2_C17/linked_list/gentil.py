



import os
import random


def randomletter():
    return chr(random.randint(97,97+25))

def randomword(longueur):
    l=[]
    for i in range(longueur):
        l.append(randomletter())
    return "".join(l)


def buildfile(filename):
    """Build
    """
    with open(filename, 'w') as f:
        for i in range(1000):
            print(randomword(16),file=f)
    

def doit():
    """
    Crer le fichier "data" et retourne deux pltests
    """
    # Creation du fichier "data" 
    buildfile("data")
    # Cration des pltest retourne deux pltests
    sol1 = Question1()
    sol2 = Question2()
    
    

    pltest= f"""
    >>> question1() == {sol1} # Question 1 étage 
    True
    """
    pltest2= f"""
    >>> question2() == {sol2} # Question 2 position 
    True
    """
    return pltest,pltest2


from re import A

voielles = "aeiou"

def Question1():
    with open("data","r") as f:
        nice= 0
        for line in f.readlines():
            line = line.strip()
            nbv=0
            dwble=0
            taboo=True
            last=""
            for x in line:
                if x in voielles:
                    nbv+=1
                if x == last:
                    dwble+=1
                if last+x in ["ab", "cd", "pq" , "xy"]:
                    taboo = False
                last = x
            if taboo and nbv >= 3 and dwble >= 1 :
                nice = nice +1 

    return nice        


def pairpresent(i,s):
    """
    je cherche si s[i]s[i+1] réapparait plus loin dans la liste.
    """
    j=i+2
    while j <len(s)-1 :
        if s[i]==s[j] and s[i+1]==s[j+1]:
            return True
        j = j + 1
    return False
    
    

def nice(s):
    """
        qjhvhtzxzqqjkmpb est sympa car il a une paire qui apparaît deux fois (qj) et une lettre qui se répète avec exactement une lettre entre elles (zxz).
    xxyxx est agréable car il a une paire qui apparaît deux fois et une lettre qui se répète avec une entre, même si les lettres utilisées par chaque règle se chevauchent.
    uurcxstgmygtbstg est méchant car il a une paire (tg) mais pas de répétition avec une seule lettre entre eux.
    ieodomkazucvgmuy est méchant car il a une lettre répétitive avec une entre (odo), mais aucune paire qui apparaît deux fois.
    >>> nice("qjhvhtzxzqqjkmpb")
    True
    >>> nice("xxyxx")
    True
    >>> nice("uurcxstgmygtbstg")
    False
    >>> nice("ieodomkazucvgmuy")
    False
    """
    pair=False
    triplet = False
    for i in range(len(s)-2):
        pair = pair or pairpresent(i,s)
        if s[i]==s[i+2] :
            triplet=True
        if pair and triplet:
            return True
    return False

def Question2():
    with open("data","r") as f:
        nic= 0
        for line in f.readlines():
            line = line.strip()
            if nice(line):
                nic+=1
        return nic

print(doit())
