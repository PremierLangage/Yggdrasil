# VOICI UN EXEMPLE DE RANDOMISATION A OUTRANCE
# DE CE FAIT, UN TEL EXO PEUT ÊTRE DONNÉ EN TP ET EN EXAMEN DANS LE MEME COURS.

@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==#|python|
from random import randint, choice, sample, shuffle

def make_latex_ens(L):
    """
    Returns a latex string for the python list `L` viewed as a set.
    """
    return " \\left\\lbrace " + ",".join([str(e) for e in L]) + "  \\right\\rbrace "

# Collections de symboles ici (on peut en rajouter à la suite...)
lists_symbols = [ ["a", "b", "c", "d", "e", "f", "g", "h"], 
                  [1, 2, 3, 4, 5, 6, 7, 8], 
                  ["\\alpha", "\\beta", "\\gamma", "\\delta", "\\eta", "\\mu", "\\tu", "\\pu"], ]

# ça va choisir un cardinal puis entre lettres et chiffres
cardinal_defi = randint(4, 6)
ensemble_defi = choice(lists_symbols)[:cardinal_defi]
ensemble_defi_str = make_latex_ens(ensemble_defi)

# Pareil, choix aléatoire des images
cardinal_img = randint(4, 6)
ensemble_img = choice(lists_symbols)[:cardinal_img]
ensemble_img_str = make_latex_ens(ensemble_img)

# nom de la fonction 
fct_name = choice(['f', 'g', 'h', 'F', 'G', 'H'])

# images de la fonction : modélisation Python par le vecteurs de toutes les images
img_fct = []
fct_val_str = "\\begin{array}{rcl} \n"
for i in range(cardinal_defi):
    img_fct.append(choice(ensemble_img))
    fct_val_str += fct_name + "(" + str(ensemble_defi[i]) + ") & = & "
    fct_val_str += str(img_fct[i]) + " \\\\\  \n"
fct_val_str += "\\end{array} \n"

# extraction de sens maintenant
is_injective = (len(set(img_fct)) == cardinal_defi)
is_surjective = (len(set(img_fct)) == cardinal_img)

# images subset 1
subimg_card_1 = randint(1, 3)
ing_subset_1 = sample(ensemble_img, subimg_card_1)

# calcul de la préimage du sous ensemble d'images 1
preimg_subset_1 = [] 
for i in range(cardinal_defi):
    if img_fct[i] in ing_subset_1:
        preimg_subset_1.append(ensemble_defi[i])
content_preimg_1= " $% "+fct_name+"^{-1} ( \\left\\lbrace "+" , ".join([str(e) for e in ing_subset_1])+" \\right\\rbrace ) "
content_preimg_1+=" =  \\left\\lbrace "+" , ".join([str(e) for e in preimg_subset_1])+" \\right\\rbrace  %$  "

# images subset 2
subimg_card_2 = randint(1, 3)
ing_subset_2 = sample(ensemble_img, subimg_card_2)

# calcul de la préimage du sous ensemble d'images 2
preimg_subset_2 = [] 
for i in range(cardinal_defi):
    if img_fct[i] in ing_subset_2:
        preimg_subset_2.append(ensemble_defi[i])
# destruction de cette bonne réponse en une mauvaise
content_preimg_2= " $% "+fct_name+"^{-1} ( \\left\\lbrace "+" , ".join([str(e) for e in ing_subset_2])+" \\right\\rbrace ) "
content_preimg_2+=" =  \\left\\lbrace "+" , ".join([str(e) for e in preimg_subset_2])+" \\right\\rbrace  %$  "

group.items = []
group.items.append({"id": "injective", "content": " $% "+fct_name+" %$  est injective"})
group.items.append({"id": "surjective", "content": " $% "+fct_name+" %$  est surjective"})
group.items.append({"id": "good1", "content": content_preimg_1})
group.items.append({"id": "good2", "content": content_preimg_2})

shuffle(group.items)

==

title=Fonction entre deux ensembles discret

text==#|markdown|
Soit $%{{ fct_name }} : A \to B %$ une fonction définie sur l'ensemble fini $% A = {{ ensemble_defi_str }}%$ 
et à valeurs dans l'ensemble fini $% B = {{ ensemble_img_str }}%$ prenant les valeurs suivantes :

$%{{ fct_val_str }}%$

<br>

**Parmi les assertions suivantes, selectionnez celles qui sont correctes avant de valider.**
==

form==
{{ group|component }}
==

evaluator==#|python|
#destruction du formulaire
form = ""

good = 0
bad = 0
for item in group.items:
    checked = item['checked']
    if (item['id'] == "injective"):
        if (is_injective and checked) or (not is_injective and not checked):
            good += 1
        else:
            bad += 1
    if (item['id'] == "surjective"):
        if (is_surjective and checked) or (not is_surjective and not checked):
            good += 1
        else:
            bad += 1

note = (good*100) // (good+bad)
feedback = "Vous avez donné "+str(good)+" réponse(s) correcte(s) et "+str(bad)+"  ereur(s)."
grade = (note, feedback)
==

