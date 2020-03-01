import random as rd
from uuid import uuid4
from components import Component
from jinja2 import Template

class CustomJSXGraph(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-math-drawer'
        self.decorator = 'CustomJSXGraph'
        super().__init__(**kwargs)

    def loadscript(self, lstcontent):
        """
        Load script and render it.
        """
        self.items = [{"id": uuid4(), "content": content} for content in lstcontent]

    def setsol_index(self, index):
        """
        Set the component solution from an index.
        """
        self._sol = self.items[index]['id']

    def setsol_content(self, content):
        """
        Set the component solution from a content.
        """
        self._sol = next(item['id'] for item in self.items if item['content'] == content)

    def shuffle(self):
        """
        Shuffle the component items.
        """
        rd.shuffle(self.items)

    def sort(self):
        """
        Sort the component items.
        """
        self.items.sort(key = lambda item : item['content'])

    def eval(self, display=True, disabled=True):
        """
        Evaluate the answer stored in the component.
        """
        for item in self.items:
            id = item['id']
            if id == self._sol and id == self.selection:
                score = 100
                if display:
                    item['css'] = 'success-state icon-check-after'
            elif id != self._sol and id == self.selection:
                if display:
                    item['css'] = 'error-state icon-times-after'
            elif id == self._sol and id != self.selection:
                score = 0
                if display:
                    item['css'] = 'icon-check-after'
        if disabled:
            self.disabled = True

        return (score, "")




