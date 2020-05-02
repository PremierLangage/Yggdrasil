extends = /model/mathinput.pl
@ /model/latex_settings/latex_settings_electronics.py [latex_settings.py]

title = Calcul d'impédance

input.virtualKeyboards = elementary

settings.feedback = raw

before ==

==

text ==
Ecrire une quantité physique.
==

evaluator ==
from sympy.physics.units.definitions.unit_definitions import meter, gram, kilogram, second, ampere, \
kelvin, mole, candela, newton, joule, watt, pascal, hertz, coulomb, volt, ohm


unit_dict = {'m': meter, 'g': gram, 'kg': kilogram, 's': second, 'A': ampere, 'K': kelvin, 'mol': mole, 'cd': candela, 'N': newton, 'J': joule, 'W': watt, 'Pa': pascal, 'Hz': hertz, 'C': coulomb, 'V': volt, 'Omega': ohm}

score = 100
feedback = str(latex2sympy(input.value, local_dict=unit_dict))
==

