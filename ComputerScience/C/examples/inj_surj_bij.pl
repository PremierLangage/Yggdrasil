@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

criteria=injectives

before==#|python|
from random import sample, randint

# Plus il y a de fonction différente, mieux c'est !
# Il suffit de faire un copier-coller et de respecter les règles suivantes :
# name --> une chaine latex pour un nom de fonction
# formula --> une chaine latex, formule en la variable x 
# dom --> une liste de domaines [E1 ,E2, ..., En] 
#         (n domaines sou forme de chaine latex) croissant pour l'inclusion
# codom --> une liste de minimum n codomaine [F1 = f(E1), F2 = f(E2), ..., Fn = f(En) , Fn+1, ...] 
#           croissant pour l'inclusion au début puis des domaines strictement plus grand que Fn.
# inj --> une liste de n booléen précisant s'il y a injectivité sur le domaine (Ei)_{1<i<n}

# De ce fait, les injections sont injectives si le booléen dit oui...
# Les fonctions sont surjectives si le codomaine est celui associé au domaine seulement...

fct_list=[]
fct_list.append({"name": "cube", 
                 "formula": "x^{3}",
                 "dom" : ["[0, 1]", "[0, 2]", "[0, 2] \\cup \\lbrace -2 \\rbrace", "[-2, 2]", "\\mathbb{R}"],
                 "codom" : ["[0, 1]", "[0, 8]", "[0, 8] \\cup \\lbrace -8 \\rbrace", "[-8, 8]", "\\mathbb{R}"],
                 "inj" : [True, True, True, True, True],})

fct_list.append({"name": "carré", 
                 "formula": "x^{2}",
                 "dom" : ["[0, 1]", "[0, 2]", "[0, 2] \\cup \\lbrace -2 \\rbrace", "[-2, 2]", "\\mathbb{R}"],
                 "codom" : ["[0, 1]", "[0, 4]", "[0, 4]", "[0, 4]", "\\mathbb{R}_{+}", "[0, 4] \\cup \\lbrace -4 \\rbrace"],
                 "inj" : [True, True, False, False, False],})

fct_list.append({"name": "exp", 
                 "formula": "e^{x}",
                 "dom" : ["[0, + \infty [", "\\mathbb{R}"],
                 "codom" : ["[1, + \infty [", "] 0 , + \infty [", "\\mathbb{R}"],
                 "inj" : [True, True],})

fct_list.append({"name": "(a > 0) \quad D",       # D comme droite assendante ?
                 "formula": "a*x + b",
                 "dom" : ["[0, 1]"],
                 "codom" : ["[b, a+b]", "\\mathbb{R}"],
                 "inj" : [True],})

fct_list.append({"name": "(a < 0) \quad d",       # d comme droite descendante ?
                 "formula": "a*x + b",
                 "dom" : ["[0, 1]", "[-2, 2]"],
                 "codom" : ["[b+a, b]", "[b+2a, b-2a]", "\\mathbb{R}"],
                 "inj" : [True, True],})


def make_latex_fct(name, formula, dom, codom):
    """
    return a nice latex string describing the function.
    """
    ans = " \\begin{array}{ccccc} "
    ans += name+" & : & "+dom+" & \\to & "+codom+" \\\\\  \n"
    ans += "& & x & \\mapsto & "+formula+" \\\\\  \n"
    ans += " \\end{array} "
    return ans

group.items = []
fct_sample = sample(fct_list, 3)
for fct in fct_sample:
    i = randint(0, len(fct["dom"]) - 1)
    dom = fct["dom"][i]
    k = min([i+1, len(fct["codom"]) - 1])
    j = randint(i, k)
    codom = fct["codom"][j]
    group.items.append({
        "id": fct["name"],
        "content": " $% \quad "+make_latex_fct(fct["name"], fct["formula"], dom, codom)+" %$ ",
    })


==

title=fonctions {{ criteria }}

text==
Reconnaitre les fonctions {{ criteria }}. Lisez systématiquement et très attentivement 
les domaines de définition ainsi que les ensembles d'arrivés.
==

form==#|html|
<b>Parmi les fonctions suivantes, selectionnez celles qui sont {{ criteria }}.</b><br>

<i>Attention, tout est possible. Tout peut-être bon et tout peut être mauvais.</i>


{{ group|component }}
==

evaluator==


grade = (100, 'Right')
==

