extends = /template/mathradio.pl

title = Propriétés d'une suite

lang = fr

before ==
numsol1=1
numsol2=1
==

text ==
Que peut-on dire de la suite $%(-n^2)%$ ?
==

form ==
{{input_1}}

{{input_2}}
==

input.1.type = radio

input.1.choices ==
Croissante
Décroissante
Ni croissante, ni décroissante
==

input.1.numsol = {{numsol1}}

input.2.type = radio

input.2.choices ==
Majorée et minorée
Majoréé mais pas minorée
Minorée mais pas majorée
Ni majorée, ni minorée
==

input.2.numsol = {{numsol2}}


evaluator ==
if "1_"+str(numsol1) in answer and "2_"+str(numsol2) in answer:
    score=100
else:
    score=0
==



