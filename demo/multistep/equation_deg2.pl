extends = /model/multistep.pl

@ /demo/basic/pays_europe.csv

title = Quiz : Capitales européennes

nbstep % 2

input =: Input

radio =: RadioGroup

stepseq % ["delta","nbsol"]

before == #|python|
radios = []
texts = []
forms = []
evaluators = []
for i in range(nbstep):
    globals()[f"radio{i}"] = CustomRadio()

    sample_rows=rd.sample(all_rows, 4)

    pays = sample_rows[0]['pays']
    article = sample_rows[0]['article']

    globals()[f"radio{i}"].setitems([row['capitale'] for row in sample_rows])
    globals()[f"radio{i}"].setsol_from_index(0)
    globals()[f"radio{i}"].shuffle()
    radios.append({"cid": globals()[f"radio{i}"].cid, "selector": globals()[f"radio{i}"].selector})

    partitif = {"le": "du ", "la": "de la ", "les": "des ", "l": "de l'"}
    
    texts.append(
        f"Quelle est la capitale {partitif[article]}  {pays} ?"
        )
    forms.append(
        """{{ radios[step]|component }}"""
        )
    #evaluators.append("""score = globals()[f"radio{step}"].eval()""")
==

intro ==
Ce quiz contient {{nbstep}} questions.
==

text.delta ==
Calculer le discriminant de cette équation.
==

form.delta ==
{{ input|component }}
==

evaluator.delta ==
score = 100
==

text.nbsol ==
Combien y a-t-il de solutions ?
==

form.nbsol ==
{{ radio|component }}
==

evaluator.nbsol ==
score = radio.eval()
==

final ==
The End.
==

