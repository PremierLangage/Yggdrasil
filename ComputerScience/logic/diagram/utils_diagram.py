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

def generate_tree(operators, size):
    """
    Generate recursively 
    """
    ans = []
    if size <= 0:
        return ans
    else:
        op = choice(operators)
        if op == "not":
            ans = ["not", generate_tree(["et", "ou"], size-1)]
            return ans
        else:
            size_left = randint(0, size-1)
            size_right = size - (1 + size_left)
            ans = [op, generate_tree(["et", "ou", "not"], size_left), 
                       generate_tree(["et", "ou", "not"], size_right)]
            return ans


def generate_random_diagram(nb_var, nb_gate):
    """
    Return a random diagram containing `nb_gate` logical gates. The circuit is 
    connected and has a single output. The circuit has `nb_var` different 
    inputs.
    """
    input_names = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"]
    ans = generate_tree(["et", "ou", "not"], nb_gate)
    return ans


def node_to_string_rec(diagram, nb):
    """
    """


def diagram_to_string(diagram):
    """
    """
    ans = "digraph G {\n"
    ans += "splines=ortho;\n"

    ans += "}\n"
