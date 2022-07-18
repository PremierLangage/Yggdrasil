# VOICI UN EXEMPLE DE RANDOMISATION A OUTRANCE
# DE CE FAIT, UN TEL EXO PEUT ÊTRE DONNÉ EN TP ET EN EXAMEN DANS LE MEME COURS.
# La probabilité de faire deux fois la même instance est quasi-nulle

# sage: 3*3*3*3*6*((binomial(6, 2)*2)**4)                                                   
# 393660000 --> versions différentes au bas mot.. 
# (probablement estimé par défault d'un facteur 1000 ou plus)
# En gros, chaque partie est quasi-unique et plus jamais jouée (c'est pas 23 comme les anniversaires)

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
fct_name = choice(['F', 'G', 'H', '\Phi', '\Psi'])

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
# feedback injectivité
if is_injective:
    fb_inj = "La fonction est injective, les images étant deux à deux différentes."
else:
    val = choice(img_fct)
    while img_fct.count(val) < 2:
        val = choice(img_fct)
    fb_inj = "La fonction n'est pas injective, $% "+str(val)+" %$ possède $% "+str(img_fct.count(val))+" %$ antécédants."
# feedback surjectivité
if is_surjective:
    fb_surj = "La fonction est surjective, les images couvrent totalement l'ensemble d'arrivée."
else:
    val = choice(ensemble_img)
    while val in img_fct:
        val = choice(ensemble_img)
    fb_surj = "La fonction n'est pas surjective, $% "+str(val)+" %$ n'a pas d'antécédant."


def make_preimg(img_fct, fct_name, ensemble_defi, ensemble_img, good=True):
    """
    returns a quadruplet `(values, state, assertion, feedback)`
    where `state` is "good" or "bad" and `assertion` a string 
    of latex describing a mathematical statement.

    when argument `good` is set to `False`, a minor
    modification is proceeded on a good mathematical 
    assertion to make it wrong.
    """
    subimg_card = randint(1, 3) # entre 1 et 3 éléments
    ing_subset = sample(ensemble_img, subimg_card) # k parmi n (tirage sans remise)
    preimg_subset = [] 
    for i in range(len(ensemble_defi)):
        if img_fct[i] in ing_subset:
            preimg_subset.append(ensemble_defi[i])
    # maintenant on casse un truc en rajoutantou en enlevant une valeur mais pas plus
    if not good:
        state = "bad"
        if (len(preimg_subset) > 0) and (randint(0,1) == 0 or (len(preimg_subset) == len(ensemble_defi))): # deletion aléatoire
            delet = choice(preimg_subset)
            feedback = " est faux car $% "+str(delet)+" \\in "+fct_name+"^{-1}( "+ make_latex_ens(ing_subset) +") %$ ."
            preimg_subset.remove(choice(preimg_subset))
        else: # 1 ajout aléatoire
            new_e = choice(ensemble_defi)
            while new_e in preimg_subset:
                new_e = choice(ensemble_defi)
            feedback = " est faux car $% "+str(new_e)+" \\notin "+fct_name+"^{-1}( "+ make_latex_ens(ing_subset) +") %$ ."
            preimg_subset.append(new_e)
            preimg_subset.sort()
    else:
        state = "good"
        feedback = " est vraie."
    prop = " $% "+fct_name+"^{-1}( "+ make_latex_ens(ing_subset)
    prop+=" ) = "+make_latex_ens(preimg_subset)+" %$ "
    return (ing_subset, state, prop, feedback)

group.items = []
group.items.append({"id": "injective", "content": " $% "+fct_name+" %$  est injective"})
group.items.append({"id": "surjective", "content": " $% "+fct_name+" %$  est surjective"})

# 4 assertions aléatoire à propos de préimage...
preimg_list = []
feedback_prop = {}
for i in range(4):
    if randint(0,1) == 0:
        good = True
    else:
        good = False
    vals, state, prop, f = make_preimg(img_fct, fct_name, ensemble_defi, ensemble_img, good=good)
    while vals in preimg_list:
        vals, state, prop, f = make_preimg(img_fct, fct_name, ensemble_defi, ensemble_img, good=good)
    preimg_list.append(vals)
    name = state+str(i)
    group.items.append({"id": name, "content": prop})
    feedback_prop[name] = f

shuffle(group.items)

==

title=Fonction entre deux ensembles finis

text==#|markdown|
Soit $%{{ fct_name }} : A \to B %$ une fonction définie sur l'ensemble fini $% A = {{ ensemble_defi_str }}%$ 
et à valeurs dans l'ensemble fini $% B = {{ ensemble_img_str }}%$ prenant les valeurs suivantes :

$%{{ fct_val_str }}%$

==

form==#|html|
<b>Parmi les propositions suivantes, selectionnez celles qui sont justes avant de valider.</b><br>

<i>Attention, tout est possible. Tout peut-être juste et tout peut être faux.</i>

{{ group|component }}
==

evaluator==#|python|

#destruction du formulaire --> IMPOSSIBLE DE CHANGER SA RÉPONSE APRÈS LA PREMIERE PROPOSITION !!!
form = ""

good = 0
bad = 0
fb_detail = ""
for item in group.items:
    checked = item['checked']
    if (item['id'] == "injective"):
        if (is_injective and checked) or (not is_injective and not checked):
            good += 1
        else:
            bad += 1
            fb_detail += "<li> "+fb_inj+" </li><br>"
    elif (item['id'] == "surjective"):
        if (is_surjective and checked) or (not is_surjective and not checked):
            good += 1
        else:
            bad += 1
            fb_detail += "<li> "+fb_surj+" </li><br>"
    else:
        if ("good" in item['id'] and checked) or ("bad" in item['id'] and not checked):
            good += 1
        else:
            bad += 1
            fb_detail += "<li> "+item['content']+feedback_prop[item['id']]+"</li><br>"

note = (good*100) // (good+bad)
if note == 100:
    feedback = """<p><span class="success-state" style="padding: 0.8em;">Bravo, c'est parfait, votre selection est la bonne !</span></p><br />"""
else:
    if bad == 1:
        error_str = " erreur.</span></p>"
    else:
        error_str = " erreurs.</span></p>"
    feedback = """<p><span class="error-state" style="padding: 0.8em;">Vous avez fait """+str(bad)+error_str
    feedback += "<br><ul>"+fb_detail+"</ul>"
grade = (note, feedback)
==

