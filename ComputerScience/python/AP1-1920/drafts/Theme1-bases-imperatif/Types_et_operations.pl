author = Olivier Bouillot


@ /utils/sandboxio.py
grader  =@ /grader/AP1_evaluator.py
builder =@ /builder/before.py

erreur_RG =: RadioGroup
erreur_RG.horizontal % true
type_RG =: RadioGroup
type_RG.horizontal % true
textbox =: Input
textbox.type = number

before==
# Autour de l'expression étudiée
import random
random.seed(seed)

lst_1 = ["'toto'", "'titi'", "'tata'"]
lst_2 = ["'foo'", "'bar'"]

type_1 = random.choice(["int", "float"])#, "string"])
if type_1 == "int":
    var_1 = random.randint(1, 4)
elif type_1 == "float":
    var_1 = random.randint(1, 8) / 2
else:
    var_1 = random.choice(lst_1)

type_2 = random.choice(["int", "float"])#, "string"])
if type_2 == "int":
    var_2 = random.randint(1, 5)
elif type_2 == "float":
    var_2 = random.randint(1, 10) / 2
else:
    var_2 = random.choice(lst_2)

op = random.choice(["+", "-", "*", "/"])

var_1 = 0.5
var_2 = 0.5
op = '*'
# Pour avoir une operation simple en cas de division...
if op == "/" and type_2 != "string":
    if type_1 == 'int':
        var_1 = int(random.randint(1, 10) * 2 * var_2)
    elif type_1 == 'float':
        var_1 *= random.randint(1, 10) * 2. * var_2

expr = str(var_1) + " " + op + " " + str(var_2)

#reste a faire : determiner le type et la valeur de expr
try:
    valeur_expr = eval(expr)
except:
    valeur_expr = None
type_expr = valeur_expr.__class__.__name__



# Autour de l'affichage de l'exercice
erreur_RG.items = [
    { "id": "oui", "content": "oui"},
    { "id": "non", "content": "non"}
]

type_RG.items = [
    {"id": "int", "content": "int"},
    {"id": "float", "content": "float"},
    {"id": "string", "content": "string"},
]
==

evaluator==
def correctement_rempli():
    # Vérification que la réponse est correctement remplie
    grade = None
    if erreur_RG.selection == '':
        grade = (-1, "Vous devez dire si l'expression produit une erreur ou non lors de son évaluation")
    if erreur_RG.selection == "oui":
        #Si l'étudiant pense qu'il y a une erreur,
        #il ne doit pas donner de type ou de valeur
        if type_RG.selection != '':
            grade = (-1, "Si l'expression produit une erreur, comment peut-elle avoir un type ?")
        elif textbox.value is not None:
            grade = (-1, "Si l'expression produit une erreur, comment peut-elle avoir une valeur ?")
    print("toto")
    if erreur_RG.selection == "non":
        #Si l'étudiant pense qu'il n'y a pas d'erreur,
        #il doit donner le type et la valeur de l'expression
        if type_RG.selection == '':
            grade = (-1, "Si l'expression ne produit pas d'erreur, elle possède un type")
        elif textbox.get(value, '') == '' or textbox.value == '':
            grade = (-1, "Si l'expression ne produit pas d'erreur, elle possède une valeur")
    return grade

def test_reponse():
    # Vérification de la réponse donnée
    if valeur_expr is None: #Eerreur a l'execution
        if erreur_RG.selection == "oui":
            grade = (100, "Bravo")
        else:
            grade = (0, "Non, cette expression provoque une erreur à l'execution")
    else: #Pas d'erreur a l'execution
        if erreur_RG.selection == "oui":
            grade = (0, "Non, cette expression ne provoque pas d'erreur à l'execution")
        else:
            #Reste a verifier le type et la valeur
            if type_expr == type_RG.value:
                if type_expr == "int":
                    valeur = int(type_expr.value)
                elif type_expr == "float":
                    valeur = float(type_expr.value)
                if valeur == valeur_expr:
                    grade = (100, "Bravo")
                else:
                    grade = (50, "Ok, cette expression ne provoque pas d'erreur à l'execution et est bien du type " + type_expr + ". Par contre, son évaluation n'est pas " + str(value) + " mais " + str(valeur_expr))
            else:
                grade = (25, "D'accord, il n'y a pas d'erreur à l'execution, mais le type de l'expression n'est pas " + type_RG.value + ", mais " + type_expr)
    return grade

grade_tmp = correctement_rempli()
if grade_tmp is not None:
    grade = grade_tmp
else:
    grade = test_reponse()
==



title== 
Types et opérations
==

text== 
Indiquer pour l'expression suivante
si elle produit un résultat correct
et le cas échéant, son type et sa valeur :
***{{ expr }}***

valeur = {{valeur_expr}}

type = {{type_expr}}
==

#form=@ /python/form/editorform.html
form==
<strong>Provoque une erreur ?</strong> {{erreur_RG|component}}
<strong>Type :</strong> {{type_RG|component}}
<strong>Valeur :</strong> {{textbox|component}}
==






