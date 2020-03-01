from components import Component
from jinja2 import Template

class CustomJSXGraph(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-math-drawer'
        self.decorator = 'CustomJSXGraph'
        super().__init__(**kwargs)

    def loadscript(self, script, dic=locals()):
        """
        Load script and render it.
        """
        self.script = Template(script).render(dic)

