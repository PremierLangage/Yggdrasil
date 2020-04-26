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


def random_name(labels, used):
    """
    """
    name = choice(labels)
    # Case in which all labels have already been used.
    if len(labels) == len(used):
        return used, name
    # Otherwise, we need a new label...
    while name in used:
        name = choice(labels)
    return used+[name], name


def label_tree_rec(diagram, labels, used):
    r"""
    """
    # case of internal node not
    if len(diagram) == 2:
        if len(diagram[1]) == 0:
            new_used, name = random_name(labels, used)
            diagram[1].append(name)
            return new_used
        else:
            new_used = label_tree_rec(diagram[1], labels, used)
            return new_used

    # case of binary operator
    if len(diagram) == 3:
        # left child 
        if len(diagram[1]) == 0:
            new_used, name = random_name(labels, used)
            diagram[1].append(name)
        else:
            new_used = label_tree_rec(diagram[1], labels, used)
        # right child
        if len(diagram[2]) == 0:
            new_used, name = random_name(labels, new_used)
            diagram[2].append(name)
            return new_used
        else:
            new_used = label_tree_rec(diagram[2], labels, new_used)
            return new_used
    return used

def generate_random_diagram(nb_var, nb_gate):
    """
    Return a random diagram containing `nb_gate` logical gates. The circuit is 
    connected and has a single output. The circuit has `nb_var` different 
    inputs.
    """
    input_names = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"]
    ans = generate_tree(["and", "or", "not"], nb_gate)
    label_tree_rec(ans, input_names[0:nb_var], [])
    return ans


def node_to_string_rec(diagram, nb_op, father):
    """
    """
    # case of a leaf
    if len(diagram) == 1:
        ans = diagram[0]+' -> '+father+';\n'
        return (nb_op, ans)

    # case of operator not
    if len(diagram) == 2:
        name_op = 'not'+str(nb_op)
        ans = name_op+' [label="not" shape=box];\n'
        ans += name_op+' -> '+father+';\n'
        new_op, str_child = node_to_string_rec(diagram[1], nb_op+1, name_op)
        return (new_op, ans+str_child)

    # case of binary operator
    if len(diagram) == 3:
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
    ans += "f;\n"

    index_op, str_diagram = node_to_string_rec(diagram, 1, "f")
    ans += str_diagram;

    ans += "}\n"
    return ans
