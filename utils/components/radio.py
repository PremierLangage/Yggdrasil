import random as rd
from uuid import uuid4
from components import Component

# New class
class Radio(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-radio-group'
        self.decorator = 'Radio'
        self.selection = None
        super().__init__(**kwargs)
        self.statement =''

    def set_items(self, items):
        """
        Set the list of items.
        """
        if isinstance(items, str):
            _items_ = items.splitlines()
        else:
            _items_ = items
        self.items = [{"id": str(uuid4()), "content": str(item)} for item in _items_]

    def set_sol(self, index):
        """
        Set the solution (from its index in the list of items).
        """
        self._sol = self.items[index]['id']

    def shuffle(self):
        """
        Shuffle the list of items.
        """
        rd.shuffle(self.items)

    def fill(self, items, indsol=0, shuffled=True):
        """
        Set the list of items and the solution.
        """
        self.set_items(items)
        self.set_sol(indsol)
        if shuffled:
            self.shuffle()

    def eval(self):
        """
        Evaluate the answer.
        """
        for item in self.items:
            id = item['id']
            if id == self._sol and id == self.selection:
                self.score = 100
                return 100
        self.score = 0
        return 0

    def show(self):
        """
        Display visual feedback.
        """
        for item in self.items:
            id = item['id']
            if id == self._sol and id == self.selection:
                item['css'] = 'success-state icon-check-after'
            elif id != self._sol and id == self.selection:
                item['css'] = 'error-state icon-times-after'
            elif id == self._sol and id != self.selection:
                item['css'] = 'icon-check-after'

    def disable(self):
        """
        Disable the component.
        """
        self.disabled = True