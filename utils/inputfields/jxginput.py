from components import Component
from jinja2 import Template
from math import hypot

class JXGInput(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-math-drawer'
        self.decorator = 'JXGInput'
        self.pointname = 'M'
        self.evalparam = {}
        super().__init__(**kwargs)

    def set_script(self, script, dic={}):
        """
        Set script and render it.
        """
        self.script = Template(script).render(dic)

    def add_script(self, script, dic={}):
        """
        Add a script and render it.
        """
        self.script += "\n" + Template(script).render(dic)

    def get_point(self, name):
        """
        Set script and render it.
        """
        return (self.points[name]['x'], self.points[name]['y'])

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
            psol.setAttribute({color: 'green'});
            """
        else:
            script = """
            psol.setAttribute({color: 'red'});
            board.create('point',[{{xsol}}, {{ysol}}],{size:2,name:'',color:'green'});
            """
        self.add_script(script, {'xsol':self.sol[0], 'ysol':self.sol[1]})

    def disable(self):
        """
        Disable the input field.
        """ 
        self.disabled = True

class JXGVector(JXGInput):

    def __init__(self, **kwargs):
        self.selector = 'c-math-drawer'
        self.decorator = 'JXGVector'
        self.pointnames = ['A', 'B']
        self.evalparam = {}
        super().__init__(**kwargs)

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