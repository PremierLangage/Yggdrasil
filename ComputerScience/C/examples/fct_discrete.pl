@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==#|python|
from random import randint, choice, sample

# deux collections de symboles ici (on peut en rajouter à la suite...)
lists_symbols = [ ["a", "b", "c", "d", "e", "f", "g", "h"], [1, 2, 3, 4, 5, 6, 7, 8] ]

# ça va choisir un cardinal puis entre lettres et chiffres
cardinal_defi = randint(3, 5)
ensemble_defi = choice(lists_symbols)[:cardinal_defi]
ensemble_defi_str = " \\left\\lbrace " + ",".join([str(e) for e in  ensemble_defi]) + "  \\right\\rbrace "

# Pareil, choix aléatoire des images
cardinal_img = randint(3, 5)
ensemble_img = choice(lists_symbols)[:cardinal_img]
ensemble_img_str = " \\left\\lbrace " + ",".join([str(e) for e in  ensemble_img]) + "  \\right\\rbrace "

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

# images subset
img_subset_card = randint(1, 3)
ing_subset = sample(ensemble_img, img_subset_card)

# calcul de la préimage du sous ensemble d'images
preimg_subset = [] 
for i in range(cardinal_defi):
    if img_fct[i] in ing_subset:
        preimg_subset.append(ensemble_defi[i])

group.items = []
group.items.append({"id": "injective", "content": " $% "+fct_name+" %$  est injective"})
group.items.append({"id": "surjective", "content": " $% "+fct_name+" %$  est surjective"})

==

title=Fonction entre deux ensembles discret

text==#|markdown|
Soit $%{{ fct_name }}%$ une fonction définie sur l'ensemble discret $% A = {{ ensemble_defi_str }}%$ 
et à valeurs dans l'ensemble $% B = {{ ensemble_img_str }}%$ prenant les valeurs suivantes :

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

