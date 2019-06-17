title=Construire une fonction sous contraintes

builder==
import sys
import json
import random

if __name__ == "__main__":
    with open(sys.argv[1],'r') as f:
        context = json.load(f)
    

    point1 = random.randint(-5, 5)
    image1 = random.randint(-5, 5)
    point2 = random.randint(-5, 5)
    image2 = random.randint(-5, 5)
    context['cond_points'] = [(point1, image1), (point2, image2)]

    context['text'] += "<br />"
    for cond in context['cond_points']:
        abs, ord = cond
        context['text'] += "$% f(" + str(abs)+ ") = " + str(ord) + "%$ <br />"

    with open(sys.argv[2], 'w+') as f:
        json.dump(context, f)
    sys.exit(0)
==

text==
Votre mission, si vous l'acceptez, est de déterminer une $% f %$ d'une variable réelle $% x %$ 
et définie partout sur les réels qui vérifient les conditions qui suivent. Tout les coups sont 
permis et de nombreuses réponses différentes sont possibles.
==

form==
$% f(x) := %$ <input type="text" name="form_function">
==

grader==

TODO !!!

==

