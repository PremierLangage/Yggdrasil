extends = /model/multistep.pl

title = Equation

nbstep % 2

input =: Input

radio =: RadioGroup
# Les deux lignes suivantes sont temporaires.
@ /utils/components/radio.py [customradio.py]
radio.decorator = CustomRadio

stepseq % ["delta","nbsol"]

before == #|python|
#radio.setitems(["Aucune","Une solution","Deux solutions"])
#radio.setsol_from_index(0)
==

intro ==
Ce quiz contient {{nbstep}} questions.
==

text.delta ==
Calculer le discriminant de cette équation.
==

forms.delta ==
{{ input|component }}
==

evaluators.delta ==
score = 100
==

texts.nbsol ==
Combien y a-t-il de solutions ?
==

forms.nbsol ==
{{ radio|component }}
==

evaluators.nbsol ==
score = radio.eval()
==

final ==
The End.
==

