import sys, json, jsonpickle
from random import randint
from math import exp

def randomintnotnul(debut, end):
    r = randint(debut, end)
    while r == 0: r = randint(debut, end)
    return r

def result(nfunct, u0, n, a, b, c):
    r = 1
    un = u0
    if nfunct == 0:
        while r < n:
            un = a*(un**2)+b
            r += 1
    if nfunct == 1:
        while r < n:
            un = a*exp(b*un+c)
            r += 1
    if nfunct == 2:
        while r < n:
            un = (a*un+b)/(un**2+1)
            r += 1
    return un

def generateAleaSuiteRecurrente():
    u0 = randint(-5, 5)
    a = randomintnotnul(-5, 5)
    b = randint(-5, 5)
    c = randint(-5, 5)
    nfunct = randint(0, 2)
    
    functions = [(str(a) + "x<sup>2</sup> + " + str(b), str(a)+"*(x**2)+"+str(b)), 
    (str(a) + "e<sup>" + str(b) + "x + " + str(c) + "</sup>", str(a)+"*exp("+str(b)+"*x+"+str(c)+")"), 
    ("(" + str(a) + "x + " + str(b) + ")/(x<sup>2</sup> + 1)", "("+str(a)+"*x+"+str(b)+")/(x**2+1)")]
    funct = functions[nfunct]

    enonces = ["calcule le terme de rang n (pas d'affichage)", "affiche le terme de rang n (pas de retour)"
    , "affiche tous les termes jusqu'au rang n inclus (pas de retour)"]
    nbenonce = randint(0, 2)

    text = "Soit la suite récurrente définie par u<sub>0</sub> = " + str(u0) + " et pour tout entier n,<br/>u<sub>n+1</sub> = f(u<sub>n</sub>) avec f(x) = "
    text += funct[0] + "<br/>"
    text += "Écrire, en Python, une fonction suiteRec de paramètre n qui " + enonces[nbenonce] + "."

    code = ""

    if nbenonce == 0:
        test = ">>> suiteRec(10)\n" + str(result(nfunct, u0, 10, a, b, c))
    else:
        test = ""

    return text, code, test

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
    
    if "soluce" not in dic:
        print("No soluce in dic necessary for this template " , file=sys.stderr)
        sys.exit(1)
    
    if dic['text'] == "" and dic['soluce'] == "":
        text, code, test = generateAleaSuiteRecurrente()
        dic['text'] = text
        dic['soluce'] = code
        dic['code'] = code
        if test != "":
            dic['pltest'] = test

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    sys.exit(0)



