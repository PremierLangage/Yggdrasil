#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

from random import choice, randint

def generate_random_diagram(nb_var, nb_gate):
    """
    Return a random diagram containing `nb_gate` logical gates. The circuit is 
    connected and has a single output. The circuit has `nb_var` different 
    inputs.
    """
    input_names = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"]
    if (nb_gate)
