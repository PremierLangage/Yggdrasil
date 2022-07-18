from uuid import uuid4
from jinja2 import Template
from math import hypot
from serializable import Serializable

class JXGViewer(Serializable):

    def __init__(self, **kwargs):
        if 'data' not in kwargs:
            self.data = {'selector': 'c-math-drawer', 'cid': str(uuid4())}
        for k, v in kwargs.items():
            setattr(self, k, v)

    def set_attributes(self, attributes):
        """
        Set attributes.
        """
        self.data['attributes'] = attributes

    def set_script(self, script, dic={}):
        """
        Set script and render it.
        """
        self.data['script'] = Template(script).render(dic)

    def add_script(self, script, dic={}):
        """
        Add a script and render it.
        """
        self.data['script'] += "\n" + Template(script).render(dic)

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


class JXGInput(Serializable):

    def __init__(self, **kwargs):
        if 'data' not in kwargs:
            self.data = {'selector': 'c-math-drawer', 'cid': str(uuid4())}
        for k, v in kwargs.items():
            setattr(self, k, v)

    def set_attributes(self, attributes):
        """
        Set attributes.
        """
        self.data['attributes'] = attributes

    def set_script(self, script, dic={}):
        """
        Set script and render it.
        """
        self.data['script'] = Template(script).render(dic)

    def add_script(self, script, dic={}):
        """
        Add a script and render it.
        """
        self.data['script'] += "\n" + Template(script).render(dic)

    def get_point(self, name):
        """
        Set script and render it.
        """
        return (self.data['points'][name]['x'], self.data['points'][name]['y'])

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


class JXGPoint(JXGInput):

    def __init__(self, **kwargs):
        self.evalparam = {}
        super().__init__(**kwargs)

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

class JXGLine(JXGInput):

    def __init__(self, **kwargs):
        self.evalparam = {}
        super().__init__(**kwargs)

    def eval(self):
        """
        Evaluate the input field
        """
        from sympy import Point, Line
        p0 = Point(*self.get_point(self.pointnames[0]))
        p1 = Point(*self.get_point(self.pointnames[1]))
        linesol = Line(self.sol[0], self.sol[1])
        tol = self.evalparam.get('tol', 0.1)
        if p0.distance(linesol) < tol and p1.distance(linesol) < tol :
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
            line.setAttribute({color: 'green'});
            """
            self.add_script(script)
        else:
            x1, y1 = self.get_point(self.pointnames[0])
            script = """
            pt1.setAttribute({color: 'red'});
            pt2.setAttribute({color: 'red'});
            line.setAttribute({color: 'red'});
            board.create('line',[[{{x0}}, {{y0}}], [{{x1}}, {{y1}}]],{color:'green'});
            """
            self.add_script(script, {'x0':self.sol[0][0], 'y0':self.sol[0][1], 'x1':self.sol[1][0], 'y1':self.sol[1][1]})
