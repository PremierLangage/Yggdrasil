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
    Generate recursively a formal tree as a Python list. The returned list 
    will modelize a tree with `size` internals nodes. The leafs of the 
    returned tree are empty list (labels come after). An internal node
    containing an operator of arity one (not) will be a list of lenght
    2 (first element describing the operator as a string), le second element 
    being the unique child. A tree rooted at a binary operator will be a 
    Python list of lenght 3 : the first element describing the operator as 
    a string then the left child (a nested list) and then the right child.

    >>> #TODO
    ...
    """
    ans = []
    if size <= 0:
        return ans
    else:
        op = choice(operators)
        if op == "not":
            ans = ["not", generate_tree(["and", "or", "xor", "nand", "nor"], size-1)]
            return ans
        else:
            size_left = randint(0, size-1)
            size_right = size - (1 + size_left)
            ans = [op, generate_tree(["and", "or", "xor", "nand", "nor", "not"], size_left), 
                       generate_tree(["and", "or", "xor", "nand", "nor", "not"], size_right)]
            return ans


def generate_proposition(operators, size):
    """
    Generate recursively a formal tree as a Python list. The returned list 
    will modelize a tree with `size` internals nodes. The leafs of the 
    returned tree are empty list (labels come after). An internal node
    containing an operator of arity one (not) will be a list of lenght
    2 (first element describing the operator as a string), le second element 
    being the unique child. A tree rooted at a binary operator will be a 
    Python list of lenght 3 : the first element describing the operator as 
    a string then the left child (a nested list) and then the right child.

    >>> #TODO
    ...
    """
    ans = []
    if size <= 0:
        return ans
    else:
        op = choice(operators)
        if op == "not":
            ans = ["not", generate_tree(["and", "or", "xor", "nand", "nor"], size-1)]
            return ans
        else:
            size_left = randint(0, size-1)
            size_right = size - (1 + size_left)
            ans = [op, generate_tree(["and", "or", "xor", "nand", "nor", "not"], size_left), 
                       generate_tree(["and", "or", "xor", "nand", "nor", "not"], size_right)]
            return ans



def random_name(labels, used):
    """
    This function is used to place random label inside circuit. But this 
    function tries to place each label at lest one time. So, if all labels 
    have not being used, the function returns a random unsued label and if 
    all labels has being used, it returns a random labels.

    The user is responsible to place good argument to this function.

    >>> #TODO
    ...
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
    """
    This function place the labels on the leafs of the circuit. This 
    is done recursively since generated circuits are trees before placing 
    the labels. This function used the `random_name` function to choice the 
    labels.

    >>> #TODO
    ...
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

    >>> #TODO
    ...
    """
    input_names = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"]
    ans = generate_tree(["and", "or", "xor","nand", "nor", "not"], nb_gate)
    label_tree_rec(ans, input_names[0:nb_var], [])
    return ans


def node_to_string_rec(diagram, nb_op, father):
    """
    This recursive function generate a DOT description of the diagram 
    in argument. It returns a python string which can be given to DOT 
    to generate an image of the circuit.

    >>> #TODO
    ...
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
    This function returns a DOT python string describing the circuit `diagram` 
    in argument.

    >>> #TODO
    ...
    """
    ans = "digraph G {\n"
    ans += "splines=ortho;\n"
    ans += "f;\n"

    index_op, str_diagram = node_to_string_rec(diagram, 1, "f")
    ans += str_diagram;

    ans += "}\n"
    return ans


def eval_diagram(diagram, d):
    """
    Returns the evaluation of the unique output of the diagram when leafs have 
    for values the content of `d`.
    """
    # evalution of a leaf
    if len(diagram) == 1:
        return d[diagram[0]]
    
    # case of unary operator
    if len(diagram) == 2:
        if diagram[0] == "not":
            return 1 - eval_diagram(diagram[1], d)

    # case of binary operator
    if len(diagram) == 3:
        if diagram[0] == "and":
            return eval_diagram(diagram[1], d)*eval_diagram(diagram[2], d)
        if diagram[0] == "or":
            return max(eval_diagram(diagram[1], d), eval_diagram(diagram[2], d))
        if diagram[0] == "nand":
            return 1 - (eval_diagram(diagram[1], d)*eval_diagram(diagram[2], d))
        if diagram[0] == "nor":
            return 1 - max(eval_diagram(diagram[1], d), eval_diagram(diagram[2], d))
        if diagram[0] == "xor":
            return (eval_diagram(diagram[1], d) + eval_diagram(diagram[2], d)) % 2


def karnaugh_table(diagram):
    """
    Return the karnaugh table as a Python list of list. A and B indexes
    column from left to right : 00 01 11 10. C and D indexes the rows from 
    top to bottom : 00 01 11 10
    """
    d = {"A": 0, "B": 0, "C": 0, "D": 0}
    ans = []
    for i in [0, 1, 3, 2]:
        vect = []
        d["C"] = i // 2
        d["D"] = i % 2
        for j in [0, 1, 3, 2]:
            d["A"] = j // 2
            d["B"] = j % 2
            vect.append(eval_diagram(diagram, d))
        ans.append(vect)
    return ans


def node_to_string_rec_color(diagram, nb_op, father, d):
    """
    This recursive function generate a DOT description of a diagram 
    evaluated at a dict `d` . It returns a python string which can be 
    given to DOT to generate an image of the evaluated circuit.

    >>> #TODO
    ...
    """
    # case of a leaf
    if len(diagram) == 1:
        res = d[diagram[0]]
        ans = diagram[0]+' -> '+father+';\n'
        if res:
            ans += diagram[0]+' [style=filled, fillcolor="palegreen"];\n'
        else:
            ans += diagram[0]+' [style=filled, fillcolor="coral"];\n'
        return (res, nb_op, ans)

    # case of operator not
    if len(diagram) == 2:
        name_op = 'not'+str(nb_op)
        ans = ''
        ans += name_op+' -> '+father+';\n'
        bool_c, new_op, str_child = node_to_string_rec_color(diagram[1], nb_op+1, name_op, d)
        if not bool_c:
            ans += name_op+' [label="not" shape=box, style=filled, fillcolor="palegreen"];\n'
        else:
            ans += name_op+' [label="not" shape=box, style=filled, fillcolor="coral"];\n'
        return (not bool_c, new_op, ans+str_child)

    # case of binary operator
    if len(diagram) == 3:
        name_op = diagram[0]+str(nb_op)
        ans = ''
        ans += name_op+' -> '+father+';\n'
        bool_ls, new_op, str_child_left = node_to_string_rec_color(diagram[1], nb_op+1, name_op, d)
        ans += str_child_left
        bool_rs, new_op, str_child_right = node_to_string_rec_color(diagram[2], new_op+1, name_op, d)
        ans += str_child_right

        # time to evaluate the current result inside the node
        if diagram[0] == "and":
            bool_res = bool_ls*bool_rs
        if diagram[0] == "or":
            bool_res = max(bool_ls, bool_rs)
        if diagram[0] == "nand":
            bool_res = 1 - (bool_ls*bool_rs)
        if diagram[0] == "nor":
            bool_res = 1 - max(bool_ls, bool_rs)
        if diagram[0] == "xor":
            bool_res = (bool_ls + bool_rs) % 2
        if bool_res:
            ans += name_op+' [label="'+diagram[0]+'" shape=box, style=filled, fillcolor="palegreen"];\n'
        else:
            ans += name_op+' [label="'+diagram[0]+'" shape=box, style=filled, fillcolor="coral"];\n'

        return (bool_res, new_op, ans)


def diagram_to_string_color(diagram, d):
    """
    This function returns a DOT python string describing the circuit `diagram` 
    in argument.

    >>> #TODO
    ...
    """
    ans = "digraph G {\n"
    ans += "splines=ortho;\n"

    bool_value, index_op, str_diagram = node_to_string_rec_color(diagram, 1, "f", d)
    ans += str_diagram;
    if bool_value:
        ans += 'f [label="f", style=filled, fillcolor="palegreen"];\n'
    else:
        ans += 'f [label="f", style=filled, fillcolor="coral"];\n'

    ans += "}\n"
    return ans


