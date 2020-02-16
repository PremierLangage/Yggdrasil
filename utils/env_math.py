from sympy import *
from random import random as rd
from utilsmath import *
from json import load
with open('keyboards.JSON') as json_file:  
    keyboards_JSON = json.load(json_file)
    env = globals().copy()



