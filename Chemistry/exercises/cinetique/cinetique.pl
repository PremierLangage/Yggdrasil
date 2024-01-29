title=Cinétique

text==

On étudie la reaction de **{{reaction}}** du **{{nomreactif}}** par la soude.  
    $${{reactif}} + OH^- \rightarrow {{produit1}} + {{produit2}} $$
la réaction est de premier ordre par rapport à chaqun des réactifs et la concentration initiale de chacun d'eux est {{CO}}. 
La constante de vitesse de la réaction vaut {{K}}.
Calculez la concentration restante de soude au bout de {{tb1}} minutes en partant d'une concentration de {{CO}}.

==

form==
<div class="input-group">
    <input id="form_answer" type="text" class="form-control" value="{{ answers__.answer }}" required/>
</div>
==

before==#|python|
import loader
import random
exercice = loader.get('data.csv', ";")
# création des varaiable défini par la premièr"e ligne du tableau CSV 
for uu in exercice:
    globals()[uu] = exercice[uu]
# Convertion des types du fichier CSV
K=float(k)


# Préparation des donnnées de l'exercice 
tb1= 5*random.randint(1,6)
CO=random.randint(11,49)/100

ref=CO/(CO*K*tb1+1)

==

evaluator==#|python|
import traceback
import sys

def expected(value, precision):
    return (abs(value-ref)/ref < precision)



try: 
    value = float(response['answer'])

    if expected(value, 0.02 ):
        grade = (100, "Bonne réponse "+str(ref))
    elif expected(value, 0.05 ):
        grade = (10, "Réponse trop imprécise différence : "+ str( (abs(value-ref)/ref)))
    else:
      grade = (0, lefeedback)
except:
    print(" Beurk ", file=sys.stderr)
    print(traceback.format_exc(), file=sys.stderr)
    grade = (-1, f"Merci de rentrer un float.")
==

lefeedback==

Ceci est le feedback **d'erreur**  



$$\frac{1}{4}$$ by renault

==

@../../utils/loader.py
@/utils/sandboxio.py
grader=@/grader/evaluator.py
builder=@/builder/before.py

@ data.csv








