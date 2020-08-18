from sympy import *
# Delete SymPy objects which create conflicts
# Actually, it would be better to make specific imports...
del C 
import random as rd
from randsympy import *
from evalsympy import *
from latex2sympy import *
from sympy2latex import *

namespace = globals().copy()

