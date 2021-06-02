import random as rd
from uuid import uuid4
from components import Component

class CustomRadio(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-radio-group'
        self.decorator = 'CustomRadio'
        self.selection = None
        super().__init__(**kwargs)
        self.statement =''

    def setStatement(self, s):
        self.statement = s 

    def setitems(self, items):
        """
        Set items in the component.
        """
        if isinstance(items, str):
            _items_ = items.splitlines()
        else:
            _items_ = items
        self.items = [{"id": str(uuid4()), "content": str(item)} for item in _items_]

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

class Radio(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-radio-group'
        self.decorator = 'Radio'
        self.selection = None
        super().__init__(**kwargs)
        self.statement =''

    def set_items(self, items):
        """
        Set items in the component.
        """
        if isinstance(items, str):
            _items_ = items.splitlines()
        else:
            _items_ = items
        self.items = [{"id": str(uuid4()), "content": str(item)} for item in _items_]

    def set_sol(self, index):
        """
        Set the component solution from an index.
        """
        self._sol = self.items[index]['id']

    def shuffle(self):
        """
        Shuffle the component items.
        """
        rd.shuffle(self.items)

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


