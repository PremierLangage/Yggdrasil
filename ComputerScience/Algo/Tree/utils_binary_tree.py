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

def random_binary_tree(nb_nodes, max_height=None, values=None):
    """
    
