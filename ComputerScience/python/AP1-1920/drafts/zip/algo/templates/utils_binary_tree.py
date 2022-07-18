"""
This module allows people to generate binary tree in Python

EXEMPLES::

>>> t = random_binary_tree(20)[0]
>>> s = t.to_string_code().replace(' ', '')
>>> binary_tree_from_code(s).to_string_code().replace(' ', '') == s
True
"""

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

    EXEMPLES::
    
    >>> BinaryNode(12)
    A binary node labeled by 12
    """
    def __init__(self, value=None):
        """
        Initialize `self` with a value. At initialisation, a fresh node has
        no child.

        TESTS::

        >>> n = BinaryNode(12)
        """
        self.value = value
        self.left = None
        self.right = None

    def __repr__(self):
        """
        Return a string describing `self`.

        TESTS::

        >>> BinaryNode(42)
        A binary node labeled by 42
        """
        return "A binary node labeled by %s"%(str(self.value))

    def nb_nodes(self):
        """
        Return the number of nodes contained in the tree rooted at `self`.

        EXAMPLES::

        """
        if self.left == None:
            if self.right == None:
                return 1
            return 1 + self.right.nb_nodes()
        if self.right == None:
            return 1 + self.left.nb_nodes()
        return 1 + self.left.nb_nodes() + self.right.nb_nodes()

    def height(self):
        """
        Return the height of the binary tree rooted at `self`. By definition, 
        the height of the leaf are zero. Le height of an internal node having 
        two children is the max the heights of its two children plus one.

        With this, the height is also the lenght of the longest path from the 
        to its leafs.

        EXEMPLES::

        >>> from tree import *
        >>> r = BinaryNode(42)
        >>> r.height()
        0
        >>> r.left = BinaryNode(-3)
        >>> r.left.right = BinaryNode(14)
        >>> r.height()
        2
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

        EXEMPLES::

        >>> r = BinaryNode(42)
        >>> r.leafs()
        [42]
        >>> r.left = BinaryNode(-3)
        >>> r.leafs()
        [-3]
        >>> r.left.left = BinaryNode(1)
        >>> r.left.right = BinaryNode(2)
        >>> r.leafs()
        [1, 2]
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

        EXEMPLES::

        >>> r = BinaryNode(42)
        >>> r.internal_nodes()
        []
        >>> r.left = BinaryNode(-3)
        >>> r.internal_nodes()
        [42]
        >>> r.left.left = BinaryNode(1)
        >>> r.left.right = BinaryNode(2)
        >>> r.internal_nodes()
        [42, -3]
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

        EXEMPLES::

        >>> r = BinaryNode(42)
        >>> r.left = BinaryNode(-3)
        >>> r.left.left = BinaryNode(1)
        >>> r.left.right = BinaryNode(2)
        >>> r.inorder_traversal()
        [1, -3, 2, 42]
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

        EXEMPLES::

        >>> r = BinaryNode(42)
        >>> r.left = BinaryNode(-3)
        >>> r.left.left = BinaryNode(1)
        >>> r.left.right = BinaryNode(2)
        >>> r.preorder_traversal()
        [42, -3, 1, 2]
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

        EXEMPLES::

        >>> r = BinaryNode(42)
        >>> r.left = BinaryNode(-3)
        >>> r.left.left = BinaryNode(1)
        >>> r.left.right = BinaryNode(2)
        >>> r.postorder_traversal()
        [1, 2, -3, 42]
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

        EXEMPLES::

        >>> r = BinaryNode(1)
        >>> r.left = BinaryNode(2)
        >>> r.right = BinaryNode(3)
        >>> r.left.left = BinaryNode(4)
        >>> r.left.right = BinaryNode(5)
        >>> r.right.left = BinaryNode(6)
        >>> r.right.right = BinaryNode(7)
        >>> r.breadth_first_traversal()
        [1, 2, 3, 4, 5, 6, 7]
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

    def __is_falling_left_rec(self):
        """
        Return a positive interger (the number of leafs) if `self` is 
        recursively falling ont the left. Return `0` otherwise.

        EXAMPLES::

        """
        if self.left is None:
            if self.right is None:
                return 1
            return 0
        if self.right is None:
            return self.left.__is_falling_left_rec()
        nb_left = self.left.__is_falling_left_rec()
        nb_right = self.left.__is_falling_left_rec()
        if nb_left == 0 or nb_right == 0 or nb_left < nb_right:
            return 0
        return nb_left + nb_right

    def is_falling_left(self):
        """
        Return `True` if `self` is recursively falling ont the left. Return 
        `False` otherwise.

        A tree recursively falling on the left if a binary tree such that 
        for all internal nodes, the number of leafs of the left child is
        greater or equal the number of leafs on the right child.

        EXAMPLES::
        """
        return (self.__is_falling_left_rec() > 0)

    def __is_falling_right_rec(self):
        """
        Return a positive interger (the number of leafs) if `self` is 
        recursively falling ont the right. Return `0` otherwise.

        EXAMPLES::

        """
        if self.left is None:
            if self.right is None:
                return 1
            return self.right.__is_falling_right_rec()
        if self.right is None:
            return 0
        nb_left = self.left.__is_falling_right_rec()
        nb_right = self.left.__is_falling_right_rec()
        if nb_left == 0 or nb_right == 0 or nb_left > nb_right:
            return 0
        return nb_left + nb_right

    def is_falling_right(self):
        """
        Return `True` if `self` is recursively falling ont the right. Return 
        `False` otherwise.

        A tree recursively falling on the right if a binary tree such that 
        for all internal nodes, the number of leafs of the right child is
        greater or equal the number of leafs on the left child.

        EXAMPLES::
        """
        return (self.__is_falling_right_rec() > 0)

    def is_increasing(self):
        """
        Return `True` if `self` is an increasing binary tree. Return `False` 
        otherwise.

        EXAMPLES::


        """
        if self.left is None:
            if self.right is None:
                return True
            if self.right.value < self.value:
                return False
            return self.right.is_increasing()
        if self.right is None:
            if self.left.value < self.value:
                return False
            return self.left.is_increasing()
        if self.right.value < self.value:
            return False
        if self.left.value < self.value:
            return False
        return self.left.is_increasing() and self.right.is_increasing()

    def is_decreasing(self):
        """
        Return `True` if `self` is a decreasing binary tree. Return `False` 
        otherwise.

        EXAMPLES::


        """
        if self.left is None:
            if self.right is None:
                return True
            if self.right.value > self.value:
                return False
            return self.right.is_decreasing()
        if self.right is None:
            if self.left.value > self.value:
                return False
            return self.left.is_decreasing()
        if self.right.value > self.value:
            return False
        if self.left.value > self.value:
            return False
        return self.left.is_decreasing() and self.right.is_decreasing()

    def _path_to_leafs_rec(self, branch=None):
        """
        Slave function associated to `path_to_leafs` method.

        EXAMPLES::

        """
        if branch is None:
            branch = []
        if self.left is None and self.right is None:
            return " - ".join(branch+[str(self.value)])+"\n"
        else:
            ans = ""
            if self.left is not None:
                ans += self.left._path_to_leafs_rec(branch+[str(self.value)])
            if self.right is not None:
                ans += self.right._path_to_leafs_rec(branch+[str(self.value)])
            return ans

    def path_to_leafs(self):
        """
        Return a Python string describing each path from the root `self` to
        each leaf of the tree. There will be only one path by line and paths 
        are ordered from left to right (the leaf leftmost go first out).

        EXAMPLES::

        """
        return self._path_to_leafs_rec()

    def to_string_code(self):
        """
        Return a string coding for the binary tree. This function is used 
        to interface binary tree from python to C. The output string 
        contains all information to build back the tree from it alone.

        The coding string is a sequence of letter then value separated with 
        spaces. For each node coming from preorder traversal, we add the 
        letter encoding the type of the node then its value. Here is the 
        foor different type of nodes :
        d : node with two children
        l : left child only
        r : right child only
        f : leaf

        EXEMPLES::

        >>> r = BinaryNode(1)
        >>> r.left = BinaryNode(2)
        >>> r.left.left = BinaryNode(3)
        >>> r.right = BinaryNode(4)
        >>> r.right.right = BinaryNode(5)
        >>> r.to_string_code()
        'd 1 l 2 f 3 r 4 f 5'
        """
        if self.left is None: 
            if self.right is None:
                return "f "+str(self.value)
            else:
                return "r "+str(self.value)+" "+self.right.to_string_code()
        else:
            if self.right is None:
                return "l "+str(self.value)+" "+self.left.to_string_code()
            else:
                return "d "+str(self.value)+" "+self.left.to_string_code()+" "+self.right.to_string_code()

    def __to_dot_BST_point_rec(self):
        """
        Slave method for `to_dot_code_BST_point` generated
        dot code for a single.

        TESTS::

        >>> from tree import *
        >>> r = BinaryNode(1)
        >>> r.left = BinaryNode(2)
        >>> '1 -> 2' in r._BinaryNode__to_dot_BST_point_rec()
        True
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

        EXAMPLES::

        >>> r = BinaryNode(1)
        >>> r.left = BinaryNode(2)
        >>> 'digraph' in r.to_dot_code_BST_point()
        True
        """
        ans = 'digraph BST {\n    size="4,4";\n    node [fontname="Arial"];\n'
        ans += self.__to_dot_BST_point_rec()
        return ans+'}\n'

def random_binary_tree(nb_nodes, max_height=None, values=None, nb_total_node=None):
    """
    Return a random binary tree having `nb_nodes` with its list of 
    different labels.

    EXAMPLES::

    >>> t = random_binary_tree(4)[0]
    >>> len(t.leafs()) + len(t.internal_nodes())
    4
    >>> n = randint(5,10)
    >>> t = random_binary_tree(n)[0]
    >>> len(t.leafs()) + len(t.internal_nodes()) == n
    True
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

def split_tree(s):
    """
    Splits a string code into a logical list. This function is internal and 
    technical, it is the basis of the inverse bijection sanding binary to 
    Python string.

    EXAMPLES::

    >>> split_tree("d2f1f2")
    ['d', 2, ['f', 1], ['f', 2]]
    >>> split_tree("r1r2r3r4r5f6")
    ['r', 1, ['r', 2, ['r', 3, ['r', 4, ['r', 5, ['f', 6]]]]]]
    >>> split_tree("d13l6r22l21f25f18")
    ['d', 13, ['l', 6, ['r', 22, ['l', 21, ['f', 25]]]], ['f', 18]]
    """
    if s[0] == 'f':
        return ['f', int(s[1:])]
    if s[0] == 'l':
        acc = ''
        i = 1
        while s[i] not in ['d', 'l', 'r', 'f']:
            acc += s[i]
            i += 1
        return ['l', int(acc), split_tree(s[i:])]
    if s[0] == 'r':
        acc = ''
        i = 1
        while s[i] not in ['d', 'l', 'r', 'f']:
            acc += s[i]
            i += 1
        return ['r', int(acc), split_tree(s[i:])]
    assert(s[0] == 'd'), "Arbre mal formée"
    acc = ''
    i = 1
    while s[i] not in ['d', 'l', 'r', 'f']:
        acc += s[i]
        i += 1
    left_acc = ''
    cumul = 1
    while cumul > 0:
        if s[i] == 'd':
            cumul += 1
        if s[i] == 'f':
            cumul -= 1
        left_acc += s[i]
        i += 1
    while s[i] not in ['d', 'l', 'r', 'f']:
        left_acc += s[i]
        i += 1    
    return ['d', int(acc), split_tree(left_acc), split_tree(s[i:])]


def binary_tree_from_list(l):
    """
    Return a binary tree from a structured list. Internal function for the
    inverse bijection sending binary trees to Python strings.

    EXAMPLES::

    >>> binary_tree_from_list(['f', 11]).leafs()
    [11]
    >>> binary_tree_from_list(['c', 2, ['f', 2], ['f', 3]]).leafs()
    [2, 3]
    >>> binary_tree_from_list(['c', 2, ['f', 2], ['f', 3]]).internal_nodes()
    [2]
    """
    if l[0] == 'f':
        return BinaryNode(l[1])
    if l[0] == 'l':
        T = BinaryNode(l[1])
        T.left = binary_tree_from_list(l[2])
        return T
    if l[0] == 'r':
        T = BinaryNode(l[1])
        T.right = binary_tree_from_list(l[2])
        return T
    T = BinaryNode(l[1])
    T.left = binary_tree_from_list(l[2])
    T.right =binary_tree_from_list(l[3])
    return T


def binary_tree_from_code(s):
    """
    Return a binary tree from a string codage `s`.

    EXAMPLES::

    >>> T = binary_tree_from_code("d4l8f22r18r20f6")
    >>> T.leafs()
    [22, 6]
    >>> T.internal_nodes()
    [4, 8, 18, 20]
    >>> t = random_binary_tree(20)[0]
    >>> s = t.to_string_code().replace(' ', '')
    >>> binary_tree_from_code(s).to_string_code().replace(' ', '') == s
    True
    """
    l = split_tree(s)
    return binary_tree_from_list(l)





