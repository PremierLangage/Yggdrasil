from jxginput import JXGInput
from jinja2 import Template
from math import hypot

class JXGVector(JXGInput):

    def __init__(self, **kwargs):
        self.selector = 'c-math-drawer'
        self.pointnames = ['A', 'B']
        self.evalparam = {}
        super().__init__(**kwargs)
        self.decorator = 'JXGVector'

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
            script = """
            pt1.setAttribute({color: 'green'});
            pt2.setAttribute({color: 'green'});
            vec.setAttribute({color: 'green'});
            """
        else:
            x1, y1 = self.get_point(self.pointnames[1])
            script = """
            pt1.setAttribute({color: 'red'});
            pt2.setAttribute({color: 'red'});
            vec.setAttribute({color: 'red'});
            board.create('segment',[pt1, [{{x1}} + {{x}}, {{y1}} + {{y}}],{color:'green', lastArrow: {type: 2, size: 6}});
            """
        self.add_script(script, {'x':self.sol[0], 'y':self.sol[1], 'x1':x1, 'y1':y1})
