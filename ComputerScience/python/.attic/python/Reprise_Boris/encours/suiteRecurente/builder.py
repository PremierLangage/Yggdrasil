from random import randint, choice

def generateAleaSuiteRecurrente():
    u0 = randint(-5, 5)
    a = randint(-5, 5)
    b = randint(-5, 5)
    c = randint(-5, 5)
    nfunct = randint(0, 2)
    functions = ["ax^2+b", "ae^{bx+c}", "(ax+b)/(x^2+1)"]
    funct = functions[nfunct]

    text = "Soit la suite récurrente définie par u_0 = " + u0 + " et pour tout entier n, u_{n+1} = f(u_n) avec "
    text += funct


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

