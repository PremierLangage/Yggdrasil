extends = /model/multistep.pl

@ /demo/basic/pays_europe.csv

title = Quiz : Capitales européennes

nbstep % 2

input =: Input

radio =: RadioGroup

stepseq % ["delta","nbsol"]

before == #|python|
radio.setitems(["Aucune","Une solution","Deux solutions"])
radio.setsol_from_index(0)

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

