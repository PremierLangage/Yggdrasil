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

from random import randint

class BinaryNode(Object):
    """
    A class modeling nodes inside binary trees. The empty node (or empty tree) 
    will be modelized by `None`. Therefore, a leaf is a node having `None` for 
    its both children.
    """
    def __init__(self, value=None):
        """
        Initialize `self` with a value. 
        """
        self.value = value
        self.left = None
        self.right = None

    def __str__(self):
        """
        A string describing `self`.
        """
        return "A binary node..."

    def to_dot_code(self):
        """

        """

def random_binary_tree(nb_nodes, max_height=None, values=None, nb_total_node=None):
    """
    Return a random binary tree having `nb_nodes` with its list of 
    different labels.
    """
    # Set the total number of nodes at first call
    # We need it to both bound values and make them unique
    if nb_total_node == None:
        nb_total_node = nb_nodes

    # generate a unique label for the current node
    # and update the set of already used labels
    label = randint(1,50+nb_total_node)
    if values is not None:
        while label in values:
            label = randint(1,50+nb_total_node)
        values = values+[label]
    else:
        values = [label]

    # if a unique node is required
    if nb_nodes == 1:
        return BinaryNode(label), values
    else:
    # Here we possibly also need to generate children
        nb_max_child = min([nb_nodes-1, 2**(max_height) - 1])
        nb_min_child = max([0, nb_nodes - (2**max_height)])
        nb_left = randint(nb_min_child, nb_max_child)
        nb_right = (max_height - 1) - nb_left
        T = BinaryNode(label)

        if max_height is not None:
            max_height = max_height - 1

        if nb_left > 0:
            left, val_left = random_binary_tree(nb_left, max_height=max_height, values=values, nb_total_node)
            values = val_left
            T.left = left
        
        if nb_right > 0:
            right, val_right = random_binary_tree(nb_right, max_height=max_height, values=values, nb_total_node)
            values = val_right
            T.right = right
        
        return T, values

