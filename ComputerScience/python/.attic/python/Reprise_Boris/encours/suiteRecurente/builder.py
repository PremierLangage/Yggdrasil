from random import randint

def generateAleaSuiteRecurrente():
    u0 = randint(-5, 5)
    a = randint(-5, 5)
    b = randint(-5, 5)
    c = randint(-5, 5)
    nfunct = randint(0, 2)
    functions = [("ax^2+b", str(a)+"*(x**2)+"+str(b)), 
    ("ae^{bx+c}", str(a)+"*exp("+str(b)+"*x+"+str(c)+")"), 
    ("(ax+b)/(x^2+1)", "("+str(a)+"*x+"+str(b)+")/(x**2+1)")]
    funct = functions[nfunct]

    enonces = ["calcule le terme de rang n (pas d'affichage)", "affiche le terme de rang n (pas de retour)"
    , "affiche tous les termes jusqu'au rang n inclus (pas de retour)"]
    nbenonce = randint(0, 2)

    text = "Soit la suite récurrente définie par u_0 = " + u0 + " et pour tout entier n, u_{n+1} = f(u_n) avec "
    text += funct + "\r\n"
    text += "Écrire, en Python, une fonction suiteRec de paramètre n qui " + enonces[nbenonce] + "."


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
        text, code = generateAleaSuiteRecurrente()



