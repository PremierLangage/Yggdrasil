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
        tol = self.evalparam.get('tol', 0.1)
        if hypot(x-xsol, y-ysol) < tol:
            self.score = 100
            jxg.addscript(script_solution, globals())
        else:
            self.score = 0
            jxg.addscript(script_solution, globals())
        return self.score

    def display_feedback(self):
        self.addscript("board.create('point',[{{xsol}}, {{ysol}}],{size:2,name:'',color:'green'});", {'xsol':self.sol[0], 'ysol':self.sol[1]})







