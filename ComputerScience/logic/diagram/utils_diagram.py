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


def node_to_string_rec(diagram, nb_op, father):
    """
    """
    # case of a leaf
    if len(diagram == 1):
        ans = diagram[0]+' -> '+father+';\n'
        return (nb_op, ans)

    # case of operator not
    if len(diagram == 2):
        name_op = 'not'+str(nb_op)
        ans = name_op+' [label="not" shape=box];\n'
        ans += name_op+' -> '+father+';\n'
        new_op, str_child = node_to_string_rec(diagram[1], nb_op+1, name_op)
        return (new_op, ans+str_child)

    # case of binary operator
    if len(diagram == 3):
        name_op = diagram[0]+str(nb_op)
        ans = name_op+' [label="'+diagram[0]+'" shape=box];\n'
        ans += name_op+' -> '+father+';\n'
        new_op, str_child_left = node_to_string_rec(diagram[1], nb_op+1, name_op)
        ans += str_child_left
        new_op, str_child_right = node_to_string_rec(diagram[2], new_op+1, name_op)
        ans += str_child_right
        return (new_op, ans)


def diagram_to_string(diagram):
    """
    """
    ans = "digraph G {\n"
    ans += "splines=ortho;\n"


    ans += "}\n"
    return ans
