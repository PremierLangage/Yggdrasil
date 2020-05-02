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

from sympy.physics.units import Quantity

def get_numeric_unit(expr):
    """
    Return the numerical part and the unit of a physical quantity.
    """
    args = arg_nested_mul(expr)
    args_numeric = []
    args_quantity = []
    for a in args:
        if isinstance(a, sp.Pow):
            if isinstance(a.base, Quantity):
                args_quantity.append(a)
            else:
                args_numeric.append(a)
        elif isinstance(a, Quantity):
            args_quantity.append(a)
        else:
            args_numeric.append(a)
    return (sp.Mul(*args_numeric), sp.Mul(*args_quantity))

unit_dict = {'m': meter, 'g': gram, 'kg': kilogram, 's': second, 'A': ampere, 'K': kelvin, 'mol': mole, 'cd': candela, 'N': newton, 'J': joule, 'W': watt, 'Pa': pascal, 'Hz': hertz, 'C': coulomb, 'V': volt, 'Omega': ohm}

score = 100
ans = latex2sympy(input.value, local_dict=unit_dict)
num, unit = get_numeric_unit(ans)
feedback = f"""
Partie numérique : {num} \n
Unité : {unit}
"""
==

