import sys, json, jsonpickle
from random import randint, seed, choice

"""def facteur(debut, end, zeroexclu=False):
    if not zeroexclu: return randint(debut, end)
    else:
        a = randint(debut, end)
        if a == 0: return facteur(debut, end, zeroexclu)
    return a"""

def generateAleaWhile(difficulty):
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
        code1 = "x = " + str(end) + "\nwhile x > " + str(debut-1) + ":\n"
        code1 += "    print(x)\n    x -= " + str(pas)
    else:
        code1 = "x = " + str(debut) + "\nwhile x < " + str(end+1) + ":\n"
        code1 += "    print(x)\n    x += " + str(pas)
    
    text.append(text1)
    code.append(code1)

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

    text.append(text2)
    code.append(code2)

    return text[difficulty], code[difficulty]

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
    else: code1 = "for x in range(" + str(debut) + ", " + str(end+1) + ", " + str(pas) + "):\n"
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

    if "taboo" not in dic:
        print("No taboo in dic necessary for this template " , file=sys.stderr)
        sys.exit(1)
    
    if "needed" not in dic:
        print("No needed in dic necessary for this template " , file=sys.stderr)
        sys.exit(1)
    
    if dic['taboo'] != "for" and dic['taboo'] != "while":
        print("Bad taboo for this template " , file=sys.stderr)
        sys.exit(1)
    
    if dic['needed'] != "for" and dic['needed'] != "while":
        print("Bad needed for this template " , file=sys.stderr)
        sys.exit(1)
    
    if dic['needed'] == dic['taboo']:
        print("Taboo and Needed mustn't be the same ", file=sys.stderr)
        sys.exit(1)

    if "soluce" not in dic:
        print("No soluce in dic necessary for this template " , file=sys.stderr)
        sys.exit(1)
    
    if dic['text'] == "" and dic['soluce'] == "":
        difficulty = int(dic['difficulty'])
        if dic['needed'] == "for":
            v = generateAleaFor(difficulty - 1)
        else:
            v = generateAleaWhile(difficulty - 1)
            
        dic['text'] = v[0]
        dic['soluce'] = v[1]
        dic['code'] = v[1]

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    sys.exit(0)

