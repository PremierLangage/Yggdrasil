import random as rd
from uuid import uuid4
from components import Component

class CustomRadio(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-radio-group'
        self.decorator = 'CustomRadio'
        self.selection = None
        super().__init__(**kwargs)
        self.text =''

    def settext(s):
        self.text = s 

    def setitems(self, contents):
        """
        Set items in the component.
        """
        self.items = [{"id": str(uuid4()), "content": content} for content in contents]

    def setsol_from_index(self, index):
        """
        Set the component solution from an index.
        """
        self._sol = self.items[index]['id']

    def setsol_from_content(self, content):
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
        self.items.sort(key = lambda item: item['content'])

    def eval(self, display=True, disabled=True):
        """
        Evaluate the answer stored in the component.
        """
        score = 0
        for item in self.items:
            id = item['id']
            if id == self._sol and id == self.selection:
                score = 100
                if display:
                    item['css'] = 'success-state icon-check-after'
            elif display and id != self._sol and id == self.selection:
                    item['css'] = 'error-state icon-times-after'
            elif display and id == self._sol and id != self.selection:
                    item['css'] = 'icon-check-after'

        self.disabled = disabled

        return score


