from jxginput import JXGInput
from jinja2 import Template
from math import hypot

class JXGVector(JXGInput):

    def __init__(self, **kwargs):
        self.selector = 'c-math-drawer'
        self.decorator = 'JXGVector'
        self.pointnames = ['A', 'B']
        self.evalparam = {}
        super().__init__(**kwargs)
        self.decorator = 'JXGInput'
        
    def eval(self):
        """
        Evaluate the input field
        """
        x0, y0 = self.get_point(self.pointnames[0])
        x1, y1 = self.get_point(self.pointnames[1])
        xsol, ysol = self.sol
        tol = self.evalparam.get('tol', 0.1)
        if hypot(x1-x0-xsol, y1-y0-ysol) < tol:
            self.score = 100
        else:
            self.score = 0
        return self.score

    def display_feedback(self):
        """
        Display visual feedback.
        """ 
        if self.score == 100:
            pass
        else:
            pass
