from sympy import *
from random import random as rd
from randsympy import *
from evalsympy import *
from latex2sympy import *
from sympy2latex import *
from json import load
json_file = open('keyboards.JSON')
keyboards_JSON = load(json_file)
json_file.close()

namespace = globals().copy()



