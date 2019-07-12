"""Ce builder concerne la conception d'exercices de boucle FOR ou WHILE
Il propose 3 niveaux de difficultés:
Niveau 1 => une seule boucle basique
Niveau 2 => une seule boucle basique avec en plus une opération sur une variable à l'intérieur de la boucle
Niveau 3 => boucles imbriquées pour réaliser des motifs"""

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

    """ difficulté 3 """
    text31 = "Écrire des boucles imbriquées permettant d'afficher le triangle isocèle suivant :<br/>"
    text31 += "&#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270;<br/>"
    text31 += "&nbsp;&#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270;<br/>"
    text31 += "&nbsp;&nbsp;&#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270;<br/>"
    text31 += "&nbsp;&nbsp;&nbsp;&#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270;<br/>"
    text31 += "&nbsp;&nbsp;&nbsp;&nbsp;&#8270; &#8270; &#8270; &#8270; &#8270; &#8270;<br/>"
    text31 += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8270; &#8270; &#8270; &#8270; &#8270;<br/>"
    text31 += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8270; &#8270; &#8270; &#8270;<br/>"
    text31 += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8270; &#8270; &#8270;<br/>"
    text31 += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8270; &#8270;<br/>"
    text31 += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8270;<br/>"
    text31 += "Un triangle isocèle avec les étoiles espacées avec un espace."
    code31 = "a = 0\nwhile a < 10:\n    line = a*\" \"\n    b = 0\n"
    code31 += "    while b < 2*(10-a)-1:\n        if b % 2 == 0: line += \"*\"\n"
    code31 += "        else: line += \" \"\n        b += 1\n    print(line)\n    a += 1"

    text.append(text31)
    code.append(code31)

    return text[difficulty], code[difficulty]

def generateAleaFor(difficulty):
    text = []
    code = []
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

    """ difficulté 3 """
    text31 = "Écrire des boucles imbriquées permettant d'afficher le triangle isocèle suivant :<br/>"
    text31 += "&#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270;<br/>"
    text31 += "&nbsp;&#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270;<br/>"
    text31 += "&nbsp;&nbsp;&#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270;<br/>"
    text31 += "&nbsp;&nbsp;&nbsp;&#8270; &#8270; &#8270; &#8270; &#8270; &#8270; &#8270;<br/>"
    text31 += "&nbsp;&nbsp;&nbsp;&nbsp;&#8270; &#8270; &#8270; &#8270; &#8270; &#8270;<br/>"
    text31 += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8270; &#8270; &#8270; &#8270; &#8270;<br/>"
    text31 += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8270; &#8270; &#8270; &#8270;<br/>"
    text31 += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8270; &#8270; &#8270;<br/>"
    text31 += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8270; &#8270;<br/>"
    text31 += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8270;<br/>"
    text31 += "Un triangle isocèle avec les étoiles espacées avec un espace."
    code31 = "for i in range(0, 10):\n    line = i*\" \"\n    for j in range(0, 2*(10-i)-1):\n"
    code31 += "        if j % 2 == 0: line += \"*\"\n        else: line += \" \"\n"
    code31 += "    print(line)"

    text.append(text31)
    code.append(code31)

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
        print("Ajouter une difficulté de la forme difficulty=n dans le fichier pl", file = sys.stderr)
        sys.exit(1)

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
    
    
    difficulty = int(dic['difficulty'])
    if dic['needed'] == "for":
        v = generateAleaFor(difficulty - 1)
    else:
        v = generateAleaWhile(difficulty - 1)
        
    dic['text'] = v[0] + "<br/>Rappel : vous ne devez pas utiliser de boucle " + dic['taboo']
    dic['soluce'] = v[1]
    """dic['code'] = v[1] #Si le prof désire voir le code généré de la soluce lors de l'appel du builder.py"""
    dic['code'] = "#Ecrivez votre code ici"

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    sys.exit(0)








