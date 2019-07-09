#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle
from random import randint,seed,choice

def facteur(debut, end, zeroexclu=False):
    if not zeroexclu: return randint(debut, end)
    else:
        a = randint(debut, end)
        if a == 0: return facteur(debut, end, zeroexclu)
    return a

def forEnsembliste():
    """ variable a, b, c, k and M for a random function f(x) = ax² + bx + c | n in N and n <= M """
    a = facteur(-10, 10)
    b = facteur(-20, 20, True)
    c = facteur(-20, 20)
    k = randint(1, 20)
    M = randint(50, 200)

    text = "Écrire une boucle affichant les éléments de l'ensemble suivant\n"

    paramSet = "{ " + str(a) + "n² "
    if b > 0 : paramSet += "+"
    paramSet += str(b) + "n "
    if c >= 0 : paramSet += "+"
    paramSet += str(c) + " | n dans N et n <= " + str(M) + "}"

    otherSet = "{ n dans N | " + str(a) + "n² "
    if b > 0 : otherSet += "+"
    otherSet += str(b) + "n "
    if c >= 0 : otherSet += "+"
    otherSet += str(c) + " est divisible par " + str(k) + " et n <= " + str(M) + "}"

    setType = [paramSet, otherSet]

    functChoice = randint(0, 1)
    text += setType[functChoice]

    """$%\leq%$"""

    code = "for n in range(0, " + str(M+1) + "):\n"
    code += "    a = " + str(a) + "*n*n "

    if b > 0 : code += "+"
    code += str(b) + "*n "
    if c > 0 : code += "+" + str(c)
    elif c < 0 : code += str(c)
    code += "\n"

    if functChoice == 1 :
        code += "    if a % " + str(k) + " == 0 : print(n)"
        return text, code

    code += "    print(a)"
    return text, code

def generateAleaFor(difficulty):
    text = []
    code = []
    if difficulty < 0 or difficulty > 4:
        sys.exit(1)
    
    """ difficulté 1 """
    debut = randint(0, 2)
    end = randint(1, 4)*5
    pas = randint(1, 3)
    rev = randint(0, 1)
    pasText = ["", "pairs", "multiples de 3"]
    debut -= debut % pas
    end -= end % pas

    text1 = "Écrire une boucle affichant les entiers " + pasText[pas - 1] + " de "
    text1 += str(debut) + " à " + str(end)

    if rev == 1:
        text1 += " dans l'ordre décroissant"
        code1 = "for x in range(" + str(end) + ", " + str(debut-1) + ", -" + str(pas) + "):\n"
    else:
        code1 = "for x in range(" + str(debut) + ", " + str(end+1) + ", " + str(pas) + "):\n"
    code1 += "    print(x)"

    text.append(text1)
    code.append(code1)

    """ difficulté 2 """
    levelup = randint(0, 1)
    elevator = ["le carré", "le cube"]
    text2 = "Écrire une boucle affichant " + elevator[levelup] + " des entiers " + pasText[pas - 1] + " de "
    text2 += str(debut) + " à " + str(end)

    if rev == 1:
        text2 += " dans l'ordre décroissant"
        code2 = "for x in range(" + str(end) + ", " + str(debut-1) + ", -" + str(pas) + "):\n"
    else:
        code2 = "for x in range(" + str(debut) + ", " + str(end+1) + ", " + str(pas) + "):\n"
    
    if levelup == 0: code2 += "    print(x*x)"
    else: code2 += "    print(x*x*x)"

    text.append(text2)
    code.append(code2)

    return text[difficulty], code[difficulty]

"""def forsimple():
    ""
   
    >>> forsimple()
    >>> forsimple()
    >>> 

    return a pair  text,code
    ""
    bas=randint(0,2)
    haut=randint(1,4)*5
    pas=randint(1,3)
    rev=randint(0,1)
    pastext=["","pairs","multiples de 3"]
    haut -= haut % pas
    bas  -=  bas  % pas
    text= "Ecrire une boucle qui affiche les entiers "+pastext[pas-1]+" de "+str(bas)+ " à "+str(haut)


    if rev==1:
        text += " dans l'ordre  décroissant"
        code = "for x in range("+str(haut)+","+str(bas-1)+",-"+str(pas)+"):\n"
    else:
        code = "for x in range("+str(bas)+","+str(haut+1)+","+str(pas)+"):\n"
    code += "    print(x)\n"
    return text,code"""

def whilesimple():
    """
   
    >>> whilesimple()
    >>> whilesimple()
    >>> 

    return a pair  text,code
    """
    bas=randint(0,2)
    pas=randint(1,3)
    haut=randint(1,2)*5*pas
    rev=randint(0,1)
    pastext=["","pairs","multiples de 3","multiple de 4"]
    haut -= haut % pas
    bas  -=  bas  % pas

    functeurs=[("les ","x"),("le carré des ","x*x"),("le cube des ","x*x*x"),("le reste modulo 7 des ","x%7"),("le double des ","x*2"),("l'opposé des ","-x"),("2 à la puissance de chaque ","2**x"),]
    funct = choice(functeurs)
    text= "Ecrire une fonction qui prend en paramêtre deux entiers bas et haut et retourne une liste "+funct[0]+" entiers "+pastext[pas-1]+" de "+str(bas)+" à "+str(haut)+""


    if rev==1:
        text += " parcourus dans l'ordre décroissant"
        code = "for x in range("+str(haut)+","+str(bas-1)+",-"+str(pas)+"):\n"
    else:
        code = "for x in range("+str(bas)+","+str(haut+1)+","+str(pas)+"):\n"
    code += "    print("+funct[1]+")\n"
    return text,code

if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    input_json = sys.argv[1]
    output_json = sys.argv[2]
    
    with open(input_json, "r") as f:
        dic = json.load(f)

    if "difficulty" not in dic:
        print("No difficulty in dic necessary for this template " , file=sys.stderr)
        sys.exit(1)

    if "about" not in dic:
        print("No about in dic necessary for this template " , file=sys.stderr)
        sys.exit(1)
    
    if dic['about'] != "for" and dic['about'] != "while":
        print("Bad about for this template " , file=sys.stderr)
        sys.exit(1)

    if "soluce" not in dic:
        print("No soluce in dic necessary for this template " , file=sys.stderr)
        sys.exit(1)
    
    if dic['text'] == "" and dic['soluce'] == "":
        difficulty = int(dic['difficulty'])
        if dic['about'] == "for":
            v = generateAleaFor(difficulty - 1)
        else:
            v = whilesimple()
            
        dic['text'] = v[0]
        dic['soluce'] = v[1]
        dic['code'] = v[1]

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    sys.exit(0)



