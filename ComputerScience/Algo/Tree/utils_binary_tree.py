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

class BinaryNode():
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

    def height(self):
        """
        Return the height of the binary tree rooted at `self`. By definition, 
        the height of the leaf are zero. Le height of an internal node having 
        two children is the max the heights of its two children plus one.

        With this, the height is also the lenght of the longest path from the 
        to its leafs.
        """
        if self.left is None:
            if self.right is None:
                return 0
            return self.right.height()+1
        else:
            if self.right is None:
                return self.left.height()+1
            else:
                return max([self.left.height(), self.right.height()])+1
    
    def leafs(self):
        """
        Return the list of values of the leafs of the binary tree rooted at 
        `self`.
        """
        if self.left is None:
            if self.right is None:
                return [self.value]
            return self.right.leafs()
        else:
            if self.right is None:
                return self.left.leafs()
            else:
                return self.left.leafs()+self.right.leafs()
    
    def internal_nodes(self):
        """
        Return the list of values of the internal nodes of the binary tree 
        rooted at `self`.
        """
        if self.left is None:
            if self.right is None:
                return []
            return [self.value]+self.right.internal_nodes()
        else:
            if self.right is None:
                return [self.value]+self.left.internal_nodes()
            else:
                return [self.value]+self.left.internal_nodes()+self.right.internal_nodes()

    def inorder_traversal(self):
        """
        Return a inorder traversal of the binary tree rooted at `self`.
        (parcours profondeur infixe in French)
        """
        if self.left is None: 
            if self.right is None:
                return [self.value]
            else:
                return [self.value]+self.right.inorder_traversal()
        else:
            if self.right is None:
                return self.left.inorder_traversal()+[self.value]
            else:
                return self.left.inorder_traversal()+[self.value]+self.right.inorder_traversal()

    def preorder_traversal(self):
        """
        Return a preorder traversal of the binary tree rooted at `self`.
        (parcours profondeur préfixe in French)
        """
        if self.left is None: 
            if self.right is None:
                return [self.value]
            else:
                return [self.value]+self.right.preorder_traversal()
        else:
            if self.right is None:
                return [self.value]+self.left.preorder_traversal()
            else:
                return [self.value]+self.left.preorder_traversal()+self.right.preorder_traversal()

    def postorder_traversal(self):
        """
        Return a postorder traversal of the binary tree rooted at `self`.
        (parcours profondeur postfixe in French)
        """
        if self.left is None: 
            if self.right is None:
                return [self.value]
            else:
                return self.right.postorder_traversal()+[self.value]
        else:
            if self.right is None:
                return self.left.postorder_traversal()+[self.value]
            else:
                return self.left.postorder_traversal()+self.right.postorder_traversal()+[self.value]

    def breadth_first_traversal(self):
        """
        Return the breadth first traversal of the binary tree rooted at `self`.
        (parcours en largeur in French)
        """
        acc = [self]
        ans = []
        while len(acc) != 0:
            node = acc.pop(0)
            ans.append(node.value)
            if node.left is not None:
                acc.append(node.left)
            if node.right is not None:
                acc.append(node.right)
        return ans

    def __to_dot_BST_point_rec(self):
        """
        Slave method for `to_dot_code_BST_point` generated
        dot code for a single.
        """
        ans = ""
        if self.left is None:
            ans += '    null_l'+str(id(self))+' [shape=point];\n'
            ans += '    '+str(self.value)+' -> null_l'+str(id(self))+';\n'
        else:
            ans += '    '+str(self.value)+' -> '+str(self.left.value)+';\n'
        if self.right is None:
            ans += '    null_r'+str(id(self))+' [shape=point];\n'
            ans += '    '+str(self.value)+' -> null_r'+str(id(self))+';\n'
        else:
            ans += '    '+str(self.value)+' -> '+str(self.right.value)+';\n'
        
        if self.left is not None:
            ans += self.left.__to_dot_BST_point_rec()
        if self.right is not None:
            ans += self.right.__to_dot_BST_point_rec()

        return ans;

    def to_dot_code_BST_point(self):
        """
        Return a DOT code to draw `self` using dot for empty node.
        """
        ans = 'digraph BST {\n    node [fontname="Arial"];\n'
        ans += self.__to_dot_BST_point_rec()
        return ans+'}\n'

def random_binary_tree(nb_nodes, max_height=None, values=None, nb_total_node=None):
    """
    Return a random binary tree having `nb_nodes` with its list of 
    different labels.
    """
    # Set the total number of nodes at first call
    # We need it to both bound values and make them unique
    if nb_total_node == None:
        nb_total_node = nb_nodes

    # Set max_height if max_height is not set
    if max_height is None:
        max_height = nb_nodes + 1

    # generate a unique label for the current node
    # and update the set of already used labels
    label = randint(1,20+nb_total_node)
    if values is not None:
        while label in values:
            label = randint(1,20+nb_total_node)
        values = values+[label]
    else:
        values = [label]

    # if a unique node is required
    if nb_nodes <= 1:
        return BinaryNode(label), values
    else:
    # Here we possibly also need to generate children
        nb_max_child = min([nb_nodes-1, 2**(max_height) - 1])
        nb_min_child = max([0, nb_nodes - (2**max_height)])
        nb_left = randint(nb_min_child, nb_max_child)
        nb_right = (nb_nodes - 1) - nb_left
        T = BinaryNode(label)
        # left child generation
        if nb_left > 0 and max_height > 0:
            left, val_left = random_binary_tree(nb_left, max_height=max_height-1, values=values, nb_total_node=nb_total_node)
            values = val_left
            T.left = left
        # right child generation
        if nb_right > 0 and max_height > 0:
            right, val_right = random_binary_tree(nb_right, max_height=max_height-1, values=values, nb_total_node=nb_total_node)
            values = val_right
            T.right = right
        
        return T, values



