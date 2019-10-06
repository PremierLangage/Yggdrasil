"""Ce builder concerne la conception d'exercices nécessitant des boucles FOR ou WHILE
Il propose 3 niveaux de difficultés:
Niveau 1 => une seule boucle basique
Niveau 2 => une seule boucle basique avec en plus une opération sur une variable à l'intérieur de la boucle
Niveau 3 => boucles imbriquées pour réaliser des motifs"""

import sys, json, jsonpickle
from random import randint, seed, choice

def generateAleaWhile(difficulty):
    exo = []

    if difficulty < 0 or difficulty > 3:
        print("La difficulté est trop grande ou trop petite, elle doit être comprise entre 1 et 4.", file = sys.stderr)
        sys.exit(1)
    
    """ difficulté 1 """
    debut = randint(-2, 2)
    end = randint(1, 4)*5
    pas = randint(1, 5)
    rev = randint(0, 1)
    pasText = ["", "pairs", "multiples de 3"," multiples de 4", "multiple de 5"]
    debut -= debut % pas
    end -= end % pas

    text1 = "Écrire une boucle affichant les entiers " + pasText[pas - 1] + " de "
    text1 += str(debut) + " à " + str(end)

    if rev == 1:
        text1 += " dans l'ordre décroissant"
        code1 = "x = " + str(end) + "\nwhile x > " + str(debut-1) + ":\n"
        code1 += "    print(x)\n    x -= " + str(pas)
    else:
        code1 = "x = " + str(debut) + "\nwhile x < " + str(end+1) + ":\n"
        code1 += "    print(x)\n    x += " + str(pas)
    
    exo.append((text1, code1))

    """ difficulté 2 """
    levelup = randint(0, 1)
    elevator = ["le carré", "le cube"]
    text2 = "Écrire une boucle affichant " + elevator[levelup] + " des entiers " + pasText[pas - 1] + " de "
    text2 += str(debut) + " à " + str(end)

    if rev == 1:
        text2 += " dans l'ordre décroissant"
        code2 = "x = " + str(end) + "\nwhile x > " + str(debut-1) + ":\n"
    else:
        code2 = "x = " + str(debut) + "\nwhile x < " + str(end+1) + ":\n"
    
    if levelup == 0: code2 += "    print(x*x)\n"
    else: code2 += "    print(x*x*x)\n"

    if rev == 1: code2 += "    x -= " + str(pas)
    else: code2 += "    x += " + str(pas)

    exo.append((text2, code2))

    """ difficulté 3 """
    rev = randint(0, 1)
    baseSize = randint(5, 10)

    text3 = "Écrire des boucles imbriquées permettant d'afficher le triangle isocèle de taille " + str(baseSize) + " suivant :<br/>"
    code3 = ""

    if rev == 0:
        for i in range(baseSize-1, -1, -1):
            line = ""
            for k in range(0, i): line += "&nbsp;"
            for j in range(0, 2*(baseSize-i)-1):
                if j % 2 == 0: line += "&#8270;"
                else: line += "&nbsp;"
            text3 += line + "<br/>"

        code3 += "a = " + str(baseSize-1) + "\nwhile a > -1:\n    line = a*\" \"\n    b = 0\n"
        code3 += "    while b < 2*(" + str(baseSize) + "-a)-1:\n        if b % 2 == 0: line += \"*\"\n"
        code3 += "        else: line += \" \"\n        b += 1\n    print(line)\n    a -= 1"
    else:
        for i in range(0, baseSize):
            line = ""
            for k in range(0, i): line += "&nbsp;"
            for j in range(0, 2*(baseSize-i)-1):
                if j % 2 == 0: line += "&#8270;"
                else: line += "&nbsp;"
            text3 += line + "<br/>"

        code3 += "a = 0\nwhile a < " + str(baseSize) + ":\n    line = a*\" \"\n    b = 0\n"
        code3 += "    while b < 2*(" + str(baseSize) + "-a)-1:\n        if b % 2 == 0: line += \"*\"\n"
        code3 += "        else: line += \" \"\n        b += 1\n    print(line)\n    a += 1"
    
    exo.append((text3, code3))

    return exo[difficulty]

def generateAleaFor(difficulty):
    exo = []

    if difficulty < 0 or difficulty > 3:
        print("La difficulté est trop grande ou trop petite, elle doit être comprise entre 1 et 4.", file = sys.stderr)
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
    else: code1 = "for x in range(" + str(debut) + ", " + str(end+1) + ", " + str(pas) + "):\n"
    code1 += "    print(x)"

    exo.append((text1, code1))

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

    exo.append((text2, code2))

    """ difficulté 3 """
    rev = randint(0, 1)
    baseSize = randint(5, 10)

    text3 = "Écrire des boucles imbriquées permettant d'afficher le triangle isocèle de taille " + str(baseSize) + " suivant :<br/>"
    code3 = ""

    if rev == 0:
        for i in range(baseSize-1, -1, -1):
            line = ""
            for k in range(0, i): line += "&nbsp;"
            for j in range(0, 2*(baseSize-i)-1):
                if j % 2 == 0: line += "&#8270;"
                else: line += "&nbsp;"
            text3 += line + "<br/>"

        code3 += "for i in range(" + str(baseSize-1) + ", -1, -1):\n    line = i*\" \"\n    for j in range(0, 2*(" + str(baseSize) + "-i)-1):\n"
        code3 += "        if j % 2 == 0: line += \"*\"\n        else: line += \" \"\n"
        code3 += "    print(line)"
    else:
        for i in range(0, baseSize):
            line = ""
            for k in range(0, i): line += "&nbsp;"
            for j in range(0, 2*(baseSize-i)-1):
                if j % 2 == 0: line += "&#8270;"
                else: line += "&nbsp;"
            text3 += line + "<br/>"

        code3 += "for i in range(0, " + str(baseSize) + "):\n    line = i*\" \"\n    for j in range(0, 2*(" + str(baseSize) + "-i)-1):\n"
        code3 += "        if j % 2 == 0: line += \"*\"\n        else: line += \" \"\n"
        code3 += "    print(line)"
    
    exo.append((text3, code3))

    return exo[difficulty]

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

    if "exoseed" in dic:
        seed(int(dic['exoseed']))

    if "difficulty" in dic:
        difficulty=int(dic['difficulty'])
    elif "difficultymax" not in dic:
        print("Ajouter la difficulté difficulty=n ou maximum de la forme difficultymax=n dans le fichier pl", file = sys.stderr)
        sys.exit(1)
    else:
        difficulty = randint(1, int(dic['difficultymax']))

    if "taboo" not in dic:
        print("Ajouter le type de boucle à ne pas utiliser dans l'exercice sous la forme taboo=type_de_boucle", file = sys.stderr)
        sys.exit(1)
    
    if "needed" not in dic:
        print("Ajouter le type de boucle à devoir utiliser dans l'exercice sous la forme needed=type_de_boucle", file = sys.stderr)
        sys.exit(1)
    
    if dic['taboo'] != "for" and dic['taboo'] != "while":
        print("Mauvais type de boucle pour \'taboo\'" , file=sys.stderr)
        sys.exit(1)
    
    if dic['needed'] != "for" and dic['needed'] != "while":
        print("Mauvais type de boucle pour \'needed\'" , file=sys.stderr)
        sys.exit(1)
    
    if dic['needed'] == dic['taboo']:
        print("\'taboo\' et \'needed\' ne doivent pas être identiques", file=sys.stderr)
        sys.exit(1)

    if "soluce" not in dic:
        print("No soluce in dic necessary for this template " , file=sys.stderr)
        sys.exit(1)
    
    
    
    if dic['needed'] == "for":
        v = generateAleaFor(difficulty - 1)
    else:
        v = generateAleaWhile(difficulty - 1)
    
    dic['difficulty'] = str(difficulty)
    dic['text'] = v[0] + "<br/>Rappel : vous ne devez pas utiliser de boucle " + dic['taboo']
    dic['soluce'] = v[1]
    """dic['code'] = v[1] #Si le prof désire voir le code généré de la soluce lors de l'appel du builder.py"""
    dic['code'] = "#Ecrivez votre code ici"

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    sys.exit(0)





