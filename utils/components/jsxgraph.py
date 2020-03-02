from components import Component
from jinja2 import Template

class CustomJSXGraph(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-math-drawer'
        self.decorator = 'CustomJSXGraph'
        super().__init__(**kwargs)

    def loadscript(self, script, dic=None):
        """
        Load script and render it.
        """
        if dic == None:
            dic = globals()
        self.script = Template(script).render(dic)


