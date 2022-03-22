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

    def disable(self):
        """
        Disable the input field.
        """ 
        self.disabled = True