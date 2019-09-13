import sys, json, jsonpickle
from random import randint, uniform

def generateAleaVariable():
    nbVariables = randint(5, 10)
    listVariables = []
    listVariablesStr = []
    variableDict = dict()

    for i in range(0, nbVariables):
        #var = randint(-100, 100) if randint(0, 1) == 1 else round(uniform(-100, 100), 2)
        #Ajout par Olivier Bouillot  et OCe
        var = randint(0, 20) if randint(0, 3) <= 2 else randint(0, 80) / 4
        listVariables.append(var)
        listVariablesStr.append(str(var))
        variableDict[chr(97+i)] = var

    text = "Affecter les valeurs suivantes " + ", ".join(listVariablesStr) + ", dans les variables respectives "
    text += ", ".join(variableDict.keys()) + ".<br/>"
    text += "Puis afficher leur somme et leur moyenne de la manière suivante : <br/>"
    text += "Somme = ...<br/>Moyenne = ..."
    
    sumV = sum(listVariables)
    moyV = sumV/nbVariables
    code = "print(\"Somme = \" + str(" + str(sumV) + "))\n"
    code += "print(\"Moyenne = \" + str(" + str(moyV) + "))\n"

    variables = ", ".join([str(chr(97+i)) + " = " + listVariablesStr[i] for i in range(0, nbVariables)])
    return text, code, variables

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

    if "var" not in dic:
        print("Nécessaire pour conserver les variables à comparer pour la correction de l'exercice", file = sys.stderr)
        sys.exit(1)
    
    if dic['text'] == "" and dic['soluce'] == "" and dic['var'] == "":
        text, code, variables = generateAleaVariable()
        dic['text'] = text
        dic['soluce'] = code
        #dic['code'] = code
        dic['var'] = variables

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    sys.exit(0)






