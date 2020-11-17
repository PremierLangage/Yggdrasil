extends = /model/math.pl
@ /utils/components/mathinput.py [custommathinput.py]

input1 =: MathInput
input1.decorator = CustomMathInput
input1.virtualKeyboards = elementary

input2 =: MathInput
input2.decorator = CustomMathInput
input2.virtualKeyboards = elementary

title = Démonstration de saiise

# Avant présentation à élève
before==
a=3
b=6
==

text ==
Donnez la somme et le produit de {{a}} et {{b}}
==

form ==
la somme
{{ input1|component}}
le produit
{{ input2|component}}
==

settings.feedback = rightwrong

settings.maxattempt % 1


# évaluer la réponse
evaluator==

text += str(input1.value)
if input1.value == a+b and input2.value==a*b : 
grade=(100,"Bravo")
else:
  grade=(0,"Raté recommencez "+str(input1.value))
==
