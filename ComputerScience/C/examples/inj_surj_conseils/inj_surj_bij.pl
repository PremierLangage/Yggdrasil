@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

criteria=injectives
# criteria=surjectives

# Le titre doit doit être fait en dur (bug jinja + PLTP)
title=Fonctions injectives

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
                 "codom" : ["[0, 1]", "[0, 4]", "[0, 4]", "[0, 4]", "\\mathbb{R}_{+}", "\\mathbb{R}"],
                 "inj" : [True, True, False, False, False],
                 "fb_inj": "$% 4 %$ a deux antécédants $% 2 %$ et $% -2 %$.",})

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

fct_list.append({"name": "(c \in \mathbb{R}) \quad C^{ste}",
                 "formula": "c",
                 "dom" : ["\\lbrace 0 \\rbrace", "[0, 10]", "\\mathbb{R}"],
                 "codom" : ["\\lbrace c \\rbrace", "\\lbrace c \\rbrace", "\\lbrace c \\rbrace", "\\mathbb{R}"],
                 "inj" : [True, False, False],
                 "fb_inj": "Tous les éléments du domaine de définition sont des antécédants de $% c %$. Une fonction constante n'est donc plus injective dès que son ensemble de définition contient au moins 2 éléments distincts.",})

fct_list.append({"name": "abs",
                 "formula": "\\lvert x \\rvert",
                 "dom" : ["[0, 5]", "[0, 10]", "[-10, 10]", "\\mathbb{R}"],
                 "codom" : ["[0, 5]", "[0, 10]", "[0, 10]", "\\mathbb{R}_{+}", "\\mathbb{R}"],
                 "inj" : [True, True, False, False],
                 "fb_inj": " $% \\lvert 1 \\rvert = \\lvert -1 \\rvert = 1 %$ ce qui fait que $% 1 %$ a 2 antécédants.",})

fct_list.append({"name": "(0 < a < b) \quad P",           # P comme un polynôme factorisé
                 "formula": "(x - a)(x - b)",
                 "dom" : ["[b, + \\infty [", "\\mathbb{R}"],
                 "codom" : ["[0, + \\infty [", "[ - \\frac{(b-a)^{2}}{4} , + \\infty [", "\\mathbb{R}"],
                 "inj" : [True, False],
                 "fb_inj": "C'est un polynôme factorisé avec deux racines distinctes positives. $% 0 %$ a donc deux antécédants $% a %$ et $% b %$.",})

fct_list.append({"name": " lp ",                          # lp comme log d'un polynome...
                 "formula": " ln(x^2 + 1) ",
                 "dom" : ["] 0 , + \\infty [", "[0 , + \\infty [", " \\mathbb{R} "],
                 "codom" : ["] 0 , + \\infty [", "[0 , + \\infty [", "[0 , + \\infty [", " \\mathbb{R} "],
                 "inj" : [True, True, False],
                 "fb_inj": " $% ln(2) %$ a deux antécédants $% 1 %$ et $% -1 %$.",})

fct_list.append({"name": " ln ",
                 "formula": " ln(x) ",
                 "dom" : ["] 0, 1 [", "] 0 , + \\infty ["],
                 "codom" : ["] - \\infty , 0 [", " \\mathbb{R} "],
                 "inj" : [True, True],
                 "fb_inj": " $% ln(2) %$ a deux antécédants $% 1 %$ et $% -1 %$.",})

fct_list.append({"name": " Sq ",
                 "formula": " \\sqrt{ \\lvert x \\rvert } ",
                 "dom" : ["[0, 1]", "[-1, 1]", "\mathbb{R}"],
                 "codom" : ["[0, 1]", "[0, 1]", "[0, + \\infty [", "\mathbb{R}"],
                 "inj" : [True, False, False],
                 "fb_inj": " $% 1 %$ a deux antécédants $% 1 %$ et $% -1 %$.",})

fct_list.append({"name": " cos ",
                 "formula": " cos(x) ",
                 "dom" : ["[0, \\frac{\\pi}{2} ]", "[0, \\pi]", "[ - \\pi , \\pi [", "[ - \\pi , \\pi ]", " \\mathbb{R} "],
                 "codom" : ["[0, 1]", "[-1, 1]", "[-1, 1]", "[-1, 1]", "[-1, 1]", " \\mathbb{R} "],
                 "inj" : [True, True, False, False, False],
                 "fb_inj": " $% 0 %$ a au moins deux antécédants $% - \\frac{\pi}{2} %$ et $% \\frac{\pi}{2} %$. ",})


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
fct_sample = sample(fct_list, 5)
for fct in fct_sample:
    i = randint(0, len(fct["dom"]) - 1)
    dom = fct["dom"][i]
    k = min([i+1, len(fct["codom"]) - 1])
    j = randint(i, k)
    codom = fct["codom"][j]
    # detection ici des bonnes et mauvaise réponse
    if criteria == "injectives":
        if fct["inj"][i]:
            soluce = "good"
        else:
            soluce = "bad"
    else: # sinon, on demande de reconnaitre les surjections...
        if i == j:
            soluce = "good" 
        else:
            soluce = "bad"
    fct["fb_surj"] = fct["name"] + " ( " + fct["dom"][i] + " ) = " + fct["codom"][i]
    group.items.append({
        "id": soluce+fct["name"],
        "content": " $% \quad "+make_latex_fct(fct["name"], fct["formula"], dom, codom)+" %$ ",
    })


==

text==
Reconnaitre les fonctions {{ criteria }}. Lisez systématiquement et très attentivement 
les domaines de définition ainsi que les ensembles d'arrivés.
==

form==#|html|
<b>Parmi les fonctions suivantes, selectionnez celles qui sont {{ criteria }}.</b><br>

<i>Attention, tout est possible. Tout peut-être bon et tout peut être mauvais.</i>


{{ group|component }}
==

evaluator==#|python|
# Destruction du formulaire --> une seule réponse possible et imposssible de modifier
form=""


nb_good = 0
nb_bad = 0
fb_detail = ""
for item in group.items:
    checked = item['checked']
    
    # coorection en mode injection....
    if criteria == "injectives":
        if ("good" in item['id'] and checked) or ("bad" in item['id'] and not checked):
            nb_good += 1
        else:
            nb_bad += 1
            if "good" in item['id']:
                fb_detail += """<li><div class="error-state" style="padding: 0.8em;">"""+item['content']+"  est bien <b>injective</b>.</div></li><br><br>"
            else:
                short_name = item['id'][3:]
                for fct in fct_sample:
                    if fct['name'] == short_name:
                        fb_detail += """<li><div class="error-state" style="padding: 0.8em;">"""+item['content']+"  n'est pas injective. "+fct['fb_inj']+"</div></li><br><br>"
    
    # sinon correction en mode surjection
    if criteria == "surjectives":
        if ("good" in item['id'] and checked) or ("bad" in item['id'] and not checked):
            nb_good += 1
        else:
            nb_bad += 1
            if "good" in item['id']:
                fb_detail += """<li><div class="error-state" style="padding: 0.8em;">"""+item['content']+"  est bien <b>surjective</b>.</div></li><br><br>"
            else:
                short_name = item['id'][3:]
                for fct in fct_sample:
                    if fct['name'] == short_name:
                        fb_detail += """<li><div class="error-state" style="padding: 0.8em;">"""+item['content']+"  n'est pas surjective. $% "+fct["fb_surj"]+" %$ </div></li><br><br>"
            

note = (nb_good*100) // (nb_good+nb_bad)
if note == 100:
    feedback = """<p><span class="success-state" style="padding: 0.8em;">Bravo, c'est parfait, votre selection est la bonne !</span></p><br />"""
else:
    if nb_bad == 1:
        error_str = " erreur.</span></p>"
    else:
        error_str = " erreurs.</span></p>"
    feedback = """<p><span class="error-state" style="padding: 0.8em;">Vous avez fait """+str(nb_bad)+error_str
    feedback += "<br><ul>"+fb_detail+"</ul>"
grade = (note, feedback)
==


