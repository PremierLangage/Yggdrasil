extends = /model/physicsinput.pl

title = Résistance d'une lampe

input.virtualKeyboards = elementary

settings.feedback = raw

before ==
U = 2*randint(5,15)*volt
I = randint(1,20)/2*ampere
R = convert_to(U/I, ohm)
==

text ==
Une lampe est traversée par un courant de $! {{I|latex}} !$. La tension aux bornes de la lampe est $! {{U|latex}} !$. Déterminer la résistance de la lampe.
==

evaluator ==
from sympy.physics.units.definitions.unit_definitions import meter, gram, kilogram, second, ampere, \
kelvin, mole, candela, newton, joule, watt, pascal, hertz, coulomb, volt, ohm

from sympy.physics.units import Quantity
from sympy.physics.units.systems.si import dimsys_SI, SI

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
dim = dimsys_SI.get_dimensional_dependencies(SI.get_dimensional_expr(unit))
feedback = f"""
Partie numérique : {num} ;
Unité : {unit} ;
Dimension : {dim}
"""
==


