extends = /model/physicsinput.pl
title = Un pré (units)
input0=: MathInput
input1=: MathInput

before==
L = 10 * rd.randint(1 , 10)
l = 10 * rd.randint(1 , 10)
per = 2 * (L + l)
super = L * l

==

text==
Donner le périmètre et la superficie d'un pré rectangulaire de longueur {{L}} m  et de largeur {{l}} m
==

form==
périmètre
{{input0|component}}
superficie
{{input1|component}}

==

evaluator==
unit_dict = {'m': meter,'cm': centimeter, 'g': gram, 'kg': kilogram, 's': second, 'A': ampere, 'K': kelvin, 'mol': mole, 'cd': candela, 'N': newton, 'J': joule, 'W': watt, 'Pa': pascal, 'Hz': hertz, 'C': coulomb, 'V': volt, 'Omega': ohm}
score, _, feedback = eval_physical(input0.value, per*meter*second, tol=1e-2, local_dict = unit_dict)
score, _, feedback = eval_physical(input1.value, super*meter**2, tol=1e-2, local_dict = unit_dict)

==
