from components import Component
from jinja2 import Template

class CustomJSXGraph(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-math-drawer'
        self.decorator = 'CustomJSXGraph'
        super().__init__(**kwargs)

    def setscript(self, script, dic={}):
        """
        Set script and render it.
        """
        self.script = Template(script).render(dic)

    def addscript(self, script, dic={}):
        """
        Add a script and render it.
        """
        self.script += Template(script).render(dic)

    def getpoint(self, name):
        """
        Set script and render it.
        """
        return (self.points[name]['x'],self.points[name]['y'])





