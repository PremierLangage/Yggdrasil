from components import Component
from jinja2 import Template
from math import hypot

class JXGInput(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-math-drawer'
        self.pointname = 'M'
        self.evalparam = {}
        super().__init__(**kwargs)
        self.decorator = 'JXGPoint'

    def eval(self):
        """
        Evaluate the input field
        """
        x, y = self.get_point(self.pointname)
        xsol, ysol = self.sol
        tol = self.evalparam.get('tol', 0.1)
        if hypot(x-xsol, y-ysol) < tol:
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
            pt.setAttribute({color: 'green'});
            """
        else:
            script = """
            pt.setAttribute({color: 'red'});
            board.create('point',[{{xsol}}, {{ysol}}],{size:2,name:'',color:'green'});
            """
        self.add_script(script, {'xsol':self.sol[0], 'ysol':self.sol[1]})

    def disable(self):
        """
        Disable the input field.
        """ 
        self.disabled = True
