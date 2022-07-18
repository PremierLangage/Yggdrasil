extends = /model/math/input.pl

title = Quantités physiques

settings.feedback = raw

text ==
Ecrire une quantité physique.

Exemples : $! 10.5 V!$, $!4.1 mol \times kg^{-1} !$, $! 3.5 \times 10^3 km/s !$, etc.
==

evaluator ==
from sympy.physics.units.definitions.unit_definitions import meter, gram, kilogram, second, ampere, \
kelvin, mole, candela, newton, joule, watt, pascal, hertz, coulomb, volt, ohm

from sympy.physics.units import Quantity
from sympy.physics.units.systems.si import dimsys_SI, SI
from latex2sympy import latex2sympy
from evalsympy import arg_flat_mul
import sympy as sp

def get_numeric_unit(expr):
    """
    Return the numerical part and the unit of a physical quantity.
    """
    args = arg_flat_mul(expr)
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
ans = latex2sympy(answers['math'], local_dict=unit_dict)
num, unit = get_numeric_unit(ans)
dim = dimsys_SI.get_dimensional_dependencies(SI.get_dimensional_expr(unit))
feedback = f"""
Partie numérique : {num} ;
Unité : {unit} ;
Dimension : {dim}
"""
==

