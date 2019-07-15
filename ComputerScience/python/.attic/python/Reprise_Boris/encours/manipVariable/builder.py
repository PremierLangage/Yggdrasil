import sys, json, jsonpickle
from random import randint, uniform

def generateAleaVariable():
    nbVariables = randint(5, 10)
    listVariables = []
    listVariablesStr = []

    for i in range(0, nbVariables):
        aleaInt = randint(0, 1)
        if aleaInt == 1: var = randint(-1000, 1000)
        else: var = uniform(-1000, 1000)
        listVariables.append(var)
        listVariablesStr.append(str(var))

    text = "Affecter les valeurs suivantes " + ", ".join(listVariablesStr) + " dans les variables respectives a, b, c, etc ...<br/>"
    text += "Puis afficher leur somme et leur moyenne."
    
    sumV = sum(listVariables)
    moyV = sumV/nbVariables
    code = "print(\"Somme = \" + str(" + str(sumV) + "))\n"
    code += "print(\"Moyenne = \" + str(" + str(moyV) + "))\n"

    return text, code

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
        text, code = generateAleaVariable()
        dic['text'] = text
        dic['soluce'] = code
        dic['code'] = code

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    sys.exit(0)
