from components import Component
from jinja2 import Template
from math import hypot
from serializable import Serializable


class JXGInput(Serializable):

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

    def disable(self):
        """
        Disable the input field.
        """
        self.data['disabled'] = True

    def render(self):
        """
        Return the HTML code of the input field.
        """
        selector = self.data['selector']
        cid = self.data['cid']
        return f"<{selector} cid='{cid}'></{selector}>"

from math import hypot

class JXGPoint(JXGInput):

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
            self.add_script(script)
        else:
            x1, y1 = self.get_point(self.pointnames[0])
            script = """
            pt1.setAttribute({color: 'red'});
            pt2.setAttribute({color: 'red'});
            vec.setAttribute({color: 'red'});
            board.create('segment',[pt1, [{{x1}} + {{x}}, {{y1}} + {{y}}]],{color:'green', lastArrow: {type: 2, size: 6}});
            """
            self.add_script(script, {'x':self.sol[0], 'y':self.sol[1], 'x1':x1, 'y1':y1})
